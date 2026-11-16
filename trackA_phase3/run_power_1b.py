"""Gate-level power of the 1-bit Track A cores on real AMP operands (kill-test flow, gsim.py unchanged).
usage: python run_power_1b.py LIBTAG NVEC [glitch|x] [designs,comma,sep] [trace]
64 lanes = 4 row blocks (of the 256-row [Sr;Si] mapping) x 16 pilot-column pairs, each lane with its own
weights. Input vectors: NVEC AMP inputs taken with a stride across all 20 iterations x 128 passes."""
import sys, time, json, numpy as np
from gsim import Lib, Netlist, Sim, unpack

LIBS = {"n45": "lib/nangate45.lib", "s130": "lib/sky130_hd_tt.lib", "n45R256": "lib/nangate45.lib", "s130R256": "lib/sky130_hd_tt.lib"}
tag = sys.argv[1] if len(sys.argv) > 1 else "n45"
NV = int(sys.argv[2]) if len(sys.argv) > 2 else 256
GL = len(sys.argv) > 3 and sys.argv[3] == "glitch"
DES = sys.argv[4].split(",") if len(sys.argv) > 4 else ["sgn_tree", "sgn_tree_ni", "and_tree_ni", "dcim", "dcim_bp"]
TR = sys.argv[5] if len(sys.argv) > 5 else "k80_0dB"
import os
R, C, BX = int(os.environ.get("R", 64)), 2, 6
NB = 256 // R
lanes = np.arange(64, dtype=np.uint64)

t = np.load("data/trackA_traces.npz")
Xall = t["X_" + TR].astype(np.int64)                      # (2560, 256)
idx = np.linspace(0, Xall.shape[0] - 1, NV).astype(int)   # spread over all AMP iterations, issue order kept
X = np.zeros((64, NV, R), np.int64); W = np.zeros((64, R, C), np.int64)
for l in range(64):
    rb, cp = l % NB, l // NB
    X[l] = Xall[idx, rb * R:(rb + 1) * R]
    W[l] = t["Wbits"][rb * R:(rb + 1) * R, [(31 * cp + 7) % 2047, (31 * cp + 8) % 2047]]
P = np.einsum("lnr,lrc->lnc", X, W)                       # sum w*x
SG = np.einsum("lnr,lrc->lnc", X, 2 * W - 1)              # sum s*x


def words(vals, nb):
    v = vals.astype(np.int64) & ((1 << nb) - 1)
    return [np.bitwise_or.reduce(((v >> b) & 1).astype(np.uint64) << lanes) for b in range(nb)]


def run(design, lib):
    nl = Netlist(f"syn/{design}_{tag}.json", lib, design)
    sim = Sim(nl)
    wn, ww = [], []
    for r in range(R):
        for c in range(C):
            b = nl.bits(f"w_{r}_{c}")
            wn += b; ww += words(W[:, r, c], len(b))
    BP = design == "dcim_bp"
    SM = design == "dcim_sm_bp"
    gb = [nl.bits(f"g_{r}") for r in range(R)] if SM else None
    xb = [nl.bits(f"b_{r}") if (BP or SM) else nl.bits(f"x_{r}") for r in range(R)]
    ctl = {k: nl.bits(k)[0] for k in ("load", "first") if k in nl.ports}
    yb = [nl.bits(f"y_{c}") for c in range(C)]
    if design == "sgn_tree":
        ncyc, win, mpc, lat = NV + 5, (3, NV), R * C, (lambda n: n + 3)
    elif design in ("sgn_tree_ni", "and_tree_ni"):
        ncyc, win, mpc, lat = NV + 4, (3, NV), R * C, (lambda n: n + 2)
    elif SM:
        ncyc, win, mpc, lat = 5 * NV + 10, (8, 5 * NV), R * C / 5, (lambda n: 5 * n + 7)
    else:
        ncyc, win, mpc, lat = 6 * NV + 10, (8, 6 * NV), R * C / 6, (lambda n: 6 * n + 8)
    REF = SG if design.startswith("sgn") else P
    want = {lat(n): n for n in range(NV)}
    errs = checked = 0
    t0 = time.time()
    F, Z = np.uint64(0xFFFFFFFFFFFFFFFF), np.uint64(0)
    for k in range(ncyc):
        nets, wv = list(wn), list(ww)
        for r in range(R):
            if design.startswith("sgn") or design.startswith("and"):
                val = X[:, k, r] if k < NV else np.zeros(64, np.int64)
            elif SM:
                n, j = (k - 1) // 5, (k - 1) % 5
                ok = 0 <= n < NV and k >= 1
                m = np.abs(X[:, n, r]) if ok else np.zeros(64, np.int64)
                val = (m >> (4 - j)) & 1
                nets += gb[r]; wv += words((X[:, n, r] < 0).astype(np.int64) if ok else np.zeros(64, np.int64), 1)
            elif BP:
                n, j = (k - 1) // 6, (k - 1) % 6
                val = ((X[:, n, r] & 63) >> (5 - j)) & 1 if (0 <= n < NV and k >= 1) else np.zeros(64, np.int64)
            else:
                n = k // 6; val = X[:, n, r] if n < NV else np.zeros(64, np.int64)
            nets += xb[r]; wv += words(val, 1 if (BP or SM) else BX)
        if "load" in ctl:
            nets += [ctl["load"]]; wv += [F if k % 6 == 0 else Z]
        if "first" in ctl:
            nets += [ctl["first"]]; wv += [F if k % (5 if SM else 6) == 2 else Z]
        sim.step(np.array(nets), np.array(wv, np.uint64), count=win[0] <= k < win[1], glitch=GL)
        if k in want:
            n = want[k]
            for c in range(C):
                bits = unpack(sim.v[np.array(yb[c])])
                val = (bits * (1 << np.arange(bits.shape[1]))).sum(1)
                val = np.where(val >= 1 << (bits.shape[1] - 1), val - (1 << bits.shape[1]), val)
                errs += int((val != REF[:, n, c]).sum()); checked += 64
    E, br = sim.energy()
    nmac = (win[1] - win[0]) * mpc * 64
    res = dict(design=design, lib=tag, glitch=GL, trace=TR, cells=len(nl.comb) + len(nl.flops), flops=len(nl.flops),
               fJ_per_MAC=E / nmac, breakdown_fJ_per_MAC={k: v / nmac for k, v in br.items()},
               leak_nW=nl.leak, leak_fJ_per_MAC_at_500MHz=nl.leak * 1e-9 / (500e6 * mpc) * 1e15,
               check=f"{checked - errs}/{checked} outputs bit-exact", sim_s=round(time.time() - t0, 1))
    print(json.dumps({k: (round(v, 2) if isinstance(v, float) else v) for k, v in res.items() if k != "breakdown_fJ_per_MAC"}), flush=True)
    return res


if __name__ == "__main__":
    lib = Lib(LIBS[tag])
    out = [run(d, lib) for d in DES]
    json.dump(out, open(f"results/power_{tag}{'_gl' if GL else ''}_{TR}_R{R}.json", "w"), indent=1)
