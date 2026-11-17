"""Proxy per-packet GRU for the SmartNIC test (log #16).

The packet-level IDS datasets (CIC-IDS2017 / UNSW-NB15 packet subsets) are not reachable from this session,
so the GRU is trained on SYNTHETIC per-packet flows [A]. The trained, int8-quantised weights and the per-packet
hidden-state vectors give realistic switching statistics for the gate-level power runs. The accuracy numbers
printed here are on synthetic data and are NOT a G5 result.

Model: single-layer GRU (PyTorch gate convention), input 16, hidden 64, window of 8 packets per flow
(BoS-style), linear head to 5 classes. Per packet: W_ih x (192 x 16) + W_hh h (192 x 64) = 15,360 MACs.
Writes data/nic_traces.npz: Whh_q (192 x 64 int8), Wih_q (192 x 16 int8), H (N x 64 int8, h_{t-1} per packet,
packets interleaved across flows as on a NIC), X (N x 16 int8), plus scales and accuracies.
usage: python train_proxy_gru.py"""
import numpy as np, jax, jax.numpy as jnp

rng = np.random.default_rng(2026)
I, H, T, NC = 16, 64, 8, 5


def flows(n, rng):
    """Synthetic per-packet features [A]. Classes: 0 benign web, 1 SYN flood, 2 port scan, 3 SSH brute force,
    4 slowloris. Features: log length, log IAT, direction, SYN/ACK/FIN/RST/PSH, 4-way port bucket, zero-payload,
    log window, TTL, noise."""
    y = rng.integers(0, NC, n)
    X = np.zeros((n, T, I), np.float32)
    for i in range(n):
        c = y[i]
        for t in range(T):
            if c == 0:
                ln = rng.choice([60, 1460, rng.integers(200, 1400)]); iat = rng.exponential(1e-2); d = t % 2
                fl = [0, 1, 0, 0, rng.random() < .5]; pb = 0
            elif c == 1:
                ln = 60 + rng.integers(0, 4); iat = rng.exponential(2e-5); d = 0; fl = [1, 0, 0, 0, 0]; pb = rng.integers(0, 4)
            elif c == 2:
                ln = 60; iat = rng.exponential(1e-3); d = t % 2; fl = [1 - d, d, 0, d, 0]; pb = rng.integers(0, 4)
            elif c == 3:
                ln = rng.integers(90, 320); iat = abs(rng.normal(0.1, 0.03)); d = t % 2; fl = [0, 1, 0, 0, 1]; pb = 1
            else:
                ln = rng.integers(60, 120); iat = rng.exponential(8.0); d = 0; fl = [0, 1, 0, 0, 1]; pb = 0
            if rng.random() < 0.08:          # label noise in the features: occasional atypical packet
                ln = rng.integers(60, 1500); iat = rng.exponential(0.05)
            f = np.zeros(I, np.float32)
            f[0] = (np.log(ln) - 6) / 1.5; f[1] = (np.log10(iat + 1e-6) + 3) / 2; f[2] = d * 2 - 1
            f[3:8] = np.array(fl, np.float32) * 2 - 1; f[8 + pb] = 1
            f[12] = 1.0 if ln <= 66 else -1.0; f[13] = rng.normal(0, 0.5); f[14] = rng.normal(0.3 * c - 0.6, 0.5)
            f[15] = rng.normal(0, 1)
            X[i, t] = f
    return X, y


def init(key):
    k = jax.random.split(key, 5); s = 1 / np.sqrt(H)
    u = lambda kk, sh: jax.random.uniform(kk, sh, minval=-s, maxval=s)
    return dict(Wih=u(k[0], (3 * H, I)), Whh=u(k[1], (3 * H, H)), bih=u(k[2], (3 * H,)), bhh=u(k[3], (3 * H,)),
                Wo=u(k[4], (NC, H)), bo=jnp.zeros(NC))


def cell(p, h, x):
    gi = p["Wih"] @ x + p["bih"]; gh = p["Whh"] @ h + p["bhh"]
    r = jax.nn.sigmoid(gi[:H] + gh[:H]); z = jax.nn.sigmoid(gi[H:2 * H] + gh[H:2 * H])
    n = jnp.tanh(gi[2 * H:] + r * gh[2 * H:])
    return (1 - z) * n + z * h


def logits(p, xs):
    h = jnp.zeros(H)
    for t in range(T):
        h = cell(p, h, xs[t])
    return p["Wo"] @ h + p["bo"]


batched = jax.vmap(logits, in_axes=(None, 0))
loss = lambda p, X, y: -jnp.mean(jax.nn.log_softmax(batched(p, X))[jnp.arange(len(y)), y])
grad = jax.jit(jax.value_and_grad(loss))

Xtr, ytr = flows(20000, rng); Xte, yte = flows(5000, rng)
p = init(jax.random.PRNGKey(0))
m = jax.tree_util.tree_map(jnp.zeros_like, p); v = jax.tree_util.tree_map(jnp.zeros_like, p)
lr, b1, b2 = 3e-3, 0.9, 0.999
for step in range(1, 1501):
    idx = rng.integers(0, len(ytr), 512)
    L, g = grad(p, Xtr[idx], ytr[idx])
    m = jax.tree_util.tree_map(lambda a, b: b1 * a + (1 - b1) * b, m, g)
    v = jax.tree_util.tree_map(lambda a, b: b2 * a + (1 - b2) * b * b, v, g)
    p = jax.tree_util.tree_map(lambda w, a, b: w - lr * (a / (1 - b1 ** step)) / (jnp.sqrt(b / (1 - b2 ** step)) + 1e-8), p, m, v)
    if step % 300 == 0:
        print("step", step, "loss %.4f" % float(L), flush=True)
P = {k: np.array(w) for k, w in p.items()}
acc_f = float((np.array(batched(p, Xte)).argmax(1) == yte).mean())


# ---------- int8 inference (weights per-matrix symmetric; x and h at 127 = 1.0), recording MVM operands
def q8(a, s):
    return np.clip(np.round(a / s), -127, 127).astype(np.int64)
sWih, sWhh = np.abs(P["Wih"]).max() / 127, np.abs(P["Whh"]).max() / 127
Wih_q, Whh_q = q8(P["Wih"], sWih), q8(P["Whh"], sWhh)
sx = np.abs(Xtr).max() / 127; sh = 1 / 127


def run_q(X):
    n = len(X); h = np.zeros((n, H)); Hrec, Xrec, preds = [], [], []
    for t in range(T):
        xq = q8(X[:, t], sx); hq = q8(h, sh)
        Hrec.append(hq); Xrec.append(xq)
        gi = (xq @ Wih_q.T) * (sx * sWih) + P["bih"]; gh = (hq @ Whh_q.T) * (sh * sWhh) + P["bhh"]
        r = 1 / (1 + np.exp(-(gi[:, :H] + gh[:, :H]))); z = 1 / (1 + np.exp(-(gi[:, H:2*H] + gh[:, H:2*H])))
        nn_ = np.tanh(gi[:, 2*H:] + r * gh[:, 2*H:]); h = (1 - z) * nn_ + z * h
    out = h @ P["Wo"].T + P["bo"]
    return out.argmax(1), np.stack(Hrec, 1), np.stack(Xrec, 1)
pred, Hrec, Xrec = run_q(Xte)
acc_q = float((pred == yte).mean())
# NIC order: packets of many concurrent flows interleaved -> random permutation over (flow, t)
Hf, Xf = Hrec.reshape(-1, H), Xrec.reshape(-1, I)
perm = rng.permutation(len(Hf))
np.savez_compressed("data/nic_traces.npz", Whh_q=Whh_q.astype(np.int8), Wih_q=Wih_q.astype(np.int8),
                    H=Hf[perm].astype(np.int8), X=Xf[perm].astype(np.int8), sWhh=sWhh, sWih=sWih,
                    acc_float_synthetic=acc_f, acc_int8_synthetic=acc_q)
print(f"synthetic test accuracy: float {acc_f:.4f}, int8 {acc_q:.4f}")
print("Whh_q: mean|w| %.1f, zero frac %.3f; h: mean|h| %.1f, zero frac %.3f, saturated(|h|>=120) %.3f" % (
    np.abs(Whh_q).mean(), (Whh_q == 0).mean(), np.abs(Hf).mean(), (Hf == 0).mean(), (np.abs(Hf) >= 120).mean()))
