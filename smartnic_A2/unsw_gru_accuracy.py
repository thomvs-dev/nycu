"""G5 for the SmartNIC GRU: accuracy of the per-packet GRU (input 16, hidden 64, first 8 packets per flow) on
UNSW-NB15 packet headers (rdpahalavan/UNSW-NB15 Packet-Fields, header columns only), float vs int8 vs 4-bit weights.

Train: Packet_Fields_File_1 (flows split 90/10 train/validation). Test: Packet_Fields_File_10 (different capture
segment). No timestamp column exists in this subset, so there is no inter-arrival-time feature.

Per-packet features (16): log IP length, TTL (zeroed in the main run: known UNSW-NB15 artifact), log TCP window,
TCP data offset, direction vs the flow's first packet, TCP flags F S R P A U, protocol one-hot (tcp, udp,
icmp/others, other), log of the service port (min of the two ports).
Quantised inference is integer for both matrix-vector products (exactly what the digital CIM and the digital
baseline compute, bit for bit); gate nonlinearities stay in float (a LUT in hardware, identical on both sides).
usage: python unsw_gru_accuracy.py FILE1.parquet FILE10.parquet OUTDIR [--ttl]
"""
import sys, os, json, numpy as np, pandas as pd, jax, jax.numpy as jnp

F_TRAIN, F_TEST, OUT = sys.argv[1], sys.argv[2], sys.argv[3]
USE_TTL = "--ttl" in sys.argv
os.makedirs(OUT, exist_ok=True)
T, I, H = 8, 16, 64
CLASSES = ["normal", "exploits", "fuzzers", "reconnaissance", "generic", "dos", "shellcode", "backdoor", "worms", "analysis"]
NC = len(CLASSES)
rng = np.random.default_rng(2026)


def flows(path):
    df = pd.read_parquet(path)
    df = df.sort_values(["flow_id", "packet_id"])
    df["k"] = df.groupby("flow_id").cumcount()
    first_src = df[df.k == 0].set_index("flow_id")["source_ip"]
    lab = df.groupby("flow_id")["attack_label"].agg(lambda s: s.value_counts().index[0])
    d = df[df.k < T].copy()
    f = np.zeros((len(d), I), np.float32)
    f[:, 0] = np.log(d["IP len"].fillna(0).astype(float).to_numpy() + 1) / 7.3
    f[:, 1] = (d["IP ttl"].fillna(0).astype(float).to_numpy() / 255.0) if USE_TTL else 0.0
    f[:, 2] = np.log1p(d["TCP window"].fillna(0).astype(float).to_numpy()) / 11.1
    f[:, 3] = d["TCP dataofs"].fillna(0).astype(float).to_numpy() / 15.0
    f[:, 4] = np.where(d["source_ip"].to_numpy() == first_src.reindex(d["flow_id"]).to_numpy(), 1.0, -1.0)
    fl = d["TCP flags"].fillna("").astype(str)
    for j, ch in enumerate("FSRPAU"):
        f[:, 5 + j] = fl.str.contains(ch, regex=False).to_numpy().astype(np.float32)
    p = d["protocol"].fillna("").astype(str)
    f[:, 11] = (p == "tcp"); f[:, 12] = (p == "udp"); f[:, 13] = p.isin(["icmp", "others"]); f[:, 14] = ~p.isin(["tcp", "udp", "icmp", "others"])
    port = np.minimum(d["source_port"].fillna(0).astype(float).to_numpy(), d["destination_port"].fillna(0).astype(float).to_numpy())
    f[:, 15] = np.log1p(port) / 11.1
    ids = d["flow_id"].to_numpy(); ks = d["k"].to_numpy()
    uf, inv = np.unique(ids, return_inverse=True)
    X = np.zeros((len(uf), T, I), np.float32)
    X[inv, ks] = f
    y = np.array([CLASSES.index(lab[u]) for u in uf])
    return X, y


Xa, ya = flows(F_TRAIN); Xte, yte = flows(F_TEST)
perm = rng.permutation(len(ya)); nv = len(ya) // 10
Xva, yva, Xtr, ytr = Xa[perm[:nv]], ya[perm[:nv]], Xa[perm[nv:]], ya[perm[nv:]]
print("flows train/val/test", len(ytr), len(yva), len(yte), flush=True)
cnt = np.bincount(ytr, minlength=NC).astype(float)
cw = jnp.array((cnt.max() / np.maximum(cnt, 1)) ** 0.5)          # inverse-sqrt class weights
# balanced-ish sampling: each batch draws half from normal, half from attacks
idx_norm, idx_att = np.where(ytr == 0)[0], np.where(ytr != 0)[0]


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


B = jax.vmap(logits, in_axes=(None, 0))
def loss(p, X, y):
    lp = jax.nn.log_softmax(B(p, X))[jnp.arange(len(y)), y]
    return -jnp.mean(cw[y] * lp)
step_fn = jax.jit(jax.value_and_grad(loss))
pred_fn = jax.jit(lambda p, X: jnp.argmax(B(p, X), 1))


def f1s(y, yp):
    out = []
    for c in range(NC):
        tp = np.sum((yp == c) & (y == c)); fp = np.sum((yp == c) & (y != c)); fn = np.sum((yp != c) & (y == c))
        out.append(0.0 if tp == 0 else 2 * tp / (2 * tp + fp + fn))
    return np.array(out)


def metrics(y, yp):
    f = f1s(y, yp)
    present = np.bincount(y, minlength=NC) > 0
    yb, pb = (y != 0), (yp != 0)
    tp = np.sum(yb & pb); bf1 = 2 * tp / (2 * tp + np.sum(~yb & pb) + np.sum(yb & ~pb))
    merge = lambda a: np.where(a >= 6, 6, a)                     # 7 classes: rare attacks merged
    f7 = [x for x in [None]]
    ym, pm = merge(y), merge(yp)
    f7 = []
    for c in range(7):
        tp7 = np.sum((pm == c) & (ym == c)); fp7 = np.sum((pm == c) & (ym != c)); fn7 = np.sum((pm != c) & (ym == c))
        f7.append(0.0 if tp7 == 0 else 2 * tp7 / (2 * tp7 + fp7 + fn7))
    return dict(macro_f1_10=float(f[present].mean()), macro_f1_7=float(np.mean(f7)), binary_f1=float(bf1),
                accuracy=float(np.mean(y == yp)), per_class_f1={CLASSES[c]: round(float(f[c]), 4) for c in range(NC) if present[c]})


p = init(jax.random.PRNGKey(0))
m = jax.tree_util.tree_map(jnp.zeros_like, p); v = jax.tree_util.tree_map(jnp.zeros_like, p)
best, best_p = -1, None
for it in range(1, 6001):
    bi = np.concatenate([rng.choice(idx_norm, 512), rng.choice(idx_att, 512)])
    L, g = step_fn(p, Xtr[bi], ytr[bi])
    m = jax.tree_util.tree_map(lambda a, b: 0.9 * a + 0.1 * b, m, g)
    v = jax.tree_util.tree_map(lambda a, b: 0.999 * a + 0.001 * b * b, v, g)
    lr = 3e-3 if it < 4000 else 1e-3
    p = jax.tree_util.tree_map(lambda w, a, b: w - lr * (a / (1 - 0.9 ** it)) / (jnp.sqrt(b / (1 - 0.999 ** it)) + 1e-8), p, m, v)
    if it % 500 == 0:
        mv = metrics(yva, np.array(pred_fn(p, Xva)))
        print(f"it {it} loss {float(L):.4f} val macroF1(10) {mv['macro_f1_10']:.4f} binF1 {mv['binary_f1']:.4f}", flush=True)
        if mv["macro_f1_10"] > best:
            best, best_p = mv["macro_f1_10"], jax.tree_util.tree_map(lambda a: a, p)
P = {k: np.array(w) for k, w in best_p.items()}


def run_int(X, wbits, record=False):
    """Integer MVMs: x and h at 8 bits (x scale from training data, h at 127 = 1.0); weights at wbits."""
    qmax = 2 ** (wbits - 1) - 1
    sWih, sWhh = np.abs(P["Wih"]).max() / qmax, np.abs(P["Whh"]).max() / qmax
    Wih_q = np.clip(np.round(P["Wih"] / sWih), -qmax, qmax).astype(np.int64)
    Whh_q = np.clip(np.round(P["Whh"] / sWhh), -qmax, qmax).astype(np.int64)
    sx = np.abs(Xtr).max() / 127
    h = np.zeros((len(X), H)); rec = []
    for t in range(T):
        xq = np.clip(np.round(X[:, t] / sx), -127, 127).astype(np.int64)
        hq = np.clip(np.round(h * 127), -127, 127).astype(np.int64)
        if record: rec.append(hq)
        gi = (xq @ Wih_q.T) * (sx * sWih) + P["bih"]; gh = (hq @ Whh_q.T) * (sWhh / 127) + P["bhh"]
        r = 1 / (1 + np.exp(-(gi[:, :H] + gh[:, :H]))); z = 1 / (1 + np.exp(-(gi[:, H:2 * H] + gh[:, H:2 * H])))
        n = np.tanh(gi[:, 2 * H:] + r * gh[:, 2 * H:]); h = (1 - z) * n + z * h
    yp = np.argmax(h @ P["Wo"].T + P["bo"], 1)
    return yp, (Whh_q, np.stack(rec, 1) if record else None)


res = dict(ttl_used=USE_TTL, flows=dict(train=int(len(ytr)), val=int(len(yva)), test=int(len(yte))),
           test_class_counts={CLASSES[c]: int(n) for c, n in enumerate(np.bincount(yte, minlength=NC))})
res["float"] = metrics(yte, np.array(pred_fn(best_p, Xte)))
yp8, (Whh_q8, Hrec) = run_int(Xte, 8, record=True)
res["int8_w8a8"] = metrics(yte, yp8)
res["int_w4a8"] = metrics(yte, run_int(Xte, 4)[0])
for k in ("int8_w8a8", "int_w4a8"):
    res[k]["delta_macro_f1_10_vs_float_points"] = round(100 * (res[k]["macro_f1_10"] - res["float"]["macro_f1_10"]), 2)
    res[k]["delta_macro_f1_7_vs_float_points"] = round(100 * (res[k]["macro_f1_7"] - res["float"]["macro_f1_7"]), 2)
    res[k]["delta_binary_f1_vs_float_points"] = round(100 * (res[k]["binary_f1"] - res["float"]["binary_f1"]), 2)
tag = "ttl" if USE_TTL else "nottl"
json.dump(res, open(f"{OUT}/unsw_accuracy_{tag}.json", "w"), indent=1)
print(json.dumps({k: v for k, v in res.items()}, indent=1))
if not USE_TTL:   # real-data operands for the energy re-run: h_{t-1} per packet, packets interleaved across flows
    Hf = Hrec.reshape(-1, H); Hf = Hf[np.random.default_rng(5).permutation(len(Hf))][:200000]
    np.savez_compressed(f"{OUT}/unsw_traces.npz", Whh_q=Whh_q8.astype(np.int8), H=Hf.astype(np.int8))
    print("h stats: mean|h| %.1f zero %.3f saturated %.3f" % (np.abs(Hf).mean(), (Hf == 0).mean(), (np.abs(Hf) >= 120).mean()))
