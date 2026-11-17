"""Gate-level power of the SmartNIC GRU cores on int8 GRU traces (kill-test flow; gsim.py unchanged).
usage: python run_power_nic.py LIBTAG CYCLES [glitch|x] [designs,comma,sep]
Designs: ws_k1, ws_k4, ws_k8, ws_k16, ws_k64, dcim_g1, dcim_g2, dcim_g8.
64 lanes, each with its own block of output columns of W_hh (192 x 64) and its own packet stream
(hidden-state vectors h_{t-1}, packets interleaved across flows). Every output is checked bit-exactly
against numpy; the output latency is found by search on the first run and must be unique."""
import sys, time, json, numpy as np
from gsim import Lib, Netlist, Sim, unpack

LIBS = {"n45": "lib/nangate45.lib", "s130": "lib/sky130_hd_tt.lib"}
tag = sys.argv[1] if len(sys.argv) > 1 else "n45"
CYC = int(sys.argv[2]) if len(sys.argv) > 2 else 512
GL = len(sys.argv) > 3 and sys.argv[3] == "glitch"
BATCH = len(sys.argv) > 5 and sys.argv[5] == "batch"   # baseline: batch k packets of independent flows,
                                                       # weight entry held k cycles, input changes every cycle
DES = sys.argv[4].split(",") if len(sys.argv) > 4 else ["ws_k1", "ws_k4", "ws_k8", "ws_k16", "ws_k64",
                                                       "dcim_g1", "dcim_g2", "dcim_g8"]
R, C, BW = 64, 2, 8
lanes = np.arange(64, dtype=np.uint64)
t = np.load("data/nic_traces.npz")
Whh = t["Whh_q"].astype(np.int64)          # (192, 64): output column o uses Whh[o, :]
Hs = t["H"].astype(np.int64)               # (N, 64)
import os
TRACE = os.environ.get("TRACE", "gru")
if TRACE == "unsw":                         # real operands: GRU trained on UNSW-NB15 headers (unsw_gru_accuracy.py)
    _u = np.load("data/unsw_traces.npz"); Whh = _u["Whh_q"].astype(np.int64); Hs = _u["H"].astype(np.int64)
if TRACE == "gauss":                        # sensitivity: unsaturated activations, sigma = 40 LSB [A]
    Hs = np.clip(np.round(np.random.default_rng(11).normal(0, 40, Hs.shape)), -127, 127).astype(np.int64)


def lane_cols(l, n):
    return [(l * n + i) % 192 for i in range(n)]


def words(vals, nb):
    v = vals.astype(np.int64) & ((1 << nb) - 1)
    return [np.bitwise_or.reduce(((v >> b) & 1).astype(np.uint64) << lanes) for b in range(nb)]


def packed_words(Wsel):
    """Wsel (64 lanes, K) int -> 8K words, field j at bits [8j, 8j+8)"""
    out = []
    for j in range(Wsel.shape[1]):
        out += words(Wsel[:, j], BW)
    return out


def run(design, lib):
    nl = Netlist(f"syn/{design}_{tag}.json", lib, design)
    sim = Sim(nl)
    cim = design.startswith("dcim")
    K = int(design.split("_k")[1]) if not cim else int(design.split("_g")[1])
    nsel = K                                   # entries per weight store (K for ws, G for dcim)
    # weights: lane l, PE (r, c), entry j -> output column cols[c + j*C]
    cols = np.array([lane_cols(l, C * nsel) for l in range(64)])          # (64, C*nsel)
    W = np.zeros((64, R, C, nsel), np.int64)
    for c in range(C):
        for j in range(nsel):
            W[:, :, c, j] = Whh[cols[:, c + j * C], :]
    wn, ww = [], []
    for r in range(R):
        for c in range(C):
            b = nl.bits(f"wv_{r}_{c}")
            wn += b; ww += packed_words(W[:, r, c, :])
    if cim:
        NV = max(CYC // (8 * nsel), 4)
        ncyc = NV * nsel * 8 + 12
        mpc = R * C / 8
    else:
        NV = max(CYC // nsel, 4)
        if BATCH:
            NV = max(NV // nsel, 1) * nsel
        ncyc = NV * nsel + 6
        mpc = R * C
    rng = np.random.default_rng(7)
    X = np.stack([Hs[rng.integers(0, len(Hs), NV)] for _ in range(64)])   # (64, NV, R)
    xb = [nl.bits(f"b_{r}") if cim else nl.bits(f"x_{r}") for r in range(R)]
    ctl = {k: nl.bits(k) for k in ("sel", "gsel", "first") if k in nl.ports}
    yb = [nl.bits(f"y_{c}") for c in range(C)]
    F, Z = np.uint64(0xFFFFFFFFFFFFFFFF), np.uint64(0)
    zero = np.zeros(64, np.int64)
    # expected results keyed by the cycle at which the input (or last plane) was applied
    expect = {}
    outs = {}
    t0 = time.time()
    win = (8, ncyc - 12) if cim else (3, ncyc - 6)
    for k in range(ncyc):
        nets, wv = list(wn), list(ww)
        if cim:
            s, p = (k - 1) // 8, (k - 1) % 8
            n, g = (s // nsel, s % nsel) if s >= 0 else (-1, 0)
            ok = k >= 1 and 0 <= n < NV
            for r in range(R):
                val = ((X[:, n, r] & 255) >> (7 - p)) & 1 if ok else zero
                nets += xb[r]; wv += words(val, 1)
            if "gsel" in ctl:
                nets += ctl["gsel"]; wv += words(np.full(64, g), len(ctl["gsel"]))
            nets += ctl["first"]; wv += [F if k % 8 == 2 else Z]
            if ok and p == 7:
                expect[k] = [(X[:, n, :] * W[:, :, c, g]).sum(1) for c in range(C)]
        elif BATCH:
            blk, rem = k // (nsel * nsel), k % (nsel * nsel)
            j, b = rem // nsel, rem % nsel
            n = blk * nsel + b
            ok = n < NV
            for r in range(R):
                nets += xb[r]; wv += words(X[:, n, r] if ok else zero, BW)
            if "sel" in ctl:
                nets += ctl["sel"]; wv += words(np.full(64, j), len(ctl["sel"]))
            if ok:
                expect[k] = [(X[:, n, :] * W[:, :, c, j]).sum(1) for c in range(C)]
        else:
            n, j = k // nsel, k % nsel
            ok = n < NV
            for r in range(R):
                nets += xb[r]; wv += words(X[:, n, r] if ok else zero, BW)
            if "sel" in ctl:
                nets += ctl["sel"]; wv += words(np.full(64, j), len(ctl["sel"]))
            if ok:
                expect[k] = [(X[:, n, :] * W[:, :, c, j]).sum(1) for c in range(C)]
        sim.step(np.array(nets), np.array(wv, np.uint64), count=win[0] <= k < win[1], glitch=GL)
        o = []
        for c in range(C):
            bits = unpack(sim.v[np.array(yb[c])])
            val = (bits * (1 << np.arange(bits.shape[1]))).sum(1)
            o.append(np.where(val >= 1 << (bits.shape[1] - 1), val - (1 << bits.shape[1]), val))
        outs[k] = o
    # latency search: the unique lag at which every expected output matches
    good = []
    for lag in range(0, 6):
        if all(k + lag in outs and all((outs[k + lag][c] == expect[k][c]).all() for c in range(C)) for k in expect):
            good.append(lag)
    checked = len(expect) * C * 64
    E, br = sim.energy()
    nmac = (win[1] - win[0]) * mpc * 64
    res = dict(design=design, trace=TRACE, lib=tag, glitch=GL, batch=BATCH and not cim, entries=nsel, cells=len(nl.comb) + len(nl.flops),
               flops=len(nl.flops), fJ_per_MAC=E / nmac, breakdown_fJ_per_MAC={k: v / nmac for k, v in br.items()},
               leak_nW=nl.leak, leak_fJ_per_MAC_at_500MHz=nl.leak * 1e-9 / (500e6 * mpc) * 1e15,
               macs_per_cycle=mpc, latency=good,
               check=(f"{checked}/{checked} outputs bit-exact at lag {good[0]}" if len(good) == 1 else f"FAILED lags={good}"),
               sim_s=round(time.time() - t0, 1))
    print(json.dumps({k: (round(v, 2) if isinstance(v, float) else v) for k, v in res.items() if k != "breakdown_fJ_per_MAC"}), flush=True)
    return res


if __name__ == "__main__":
    lib = Lib(LIBS[tag])
    out = [run(d, lib) for d in DES]
    json.dump(out, open(f"results/power_{tag}{'_gl' if GL else ''}{'_batch' if BATCH else ''}{'_' + TRACE if TRACE != 'gru' else ''}_{'_'.join(DES)}.json", "w"), indent=1)
