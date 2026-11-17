"""Summarise the SmartNIC GRU synthesis runs -> results/summary_nic.json (and print the tables).

Strongest baseline at k > 1 = min(weight-switching, batched) for each library / glitch case.
CIM at cycles-per-packet k uses dcim_g1 for k <= 8 (8/k weight copies, same energy per MAC),
dcim_g2 for k = 16, dcim_g8 for k = 64.
System ratio adds the common per-MAC terms of the Phase 3 model (activation movement, control, C) as a fraction
of the hardwired baseline core: f = 0.39 (pessimistic, C = 56 fJ vs PE 143 fJ) and 0.08 (optimistic, 11 vs 143) [P].
"""
import json, glob

rows = {}
for f in glob.glob("results/power_*.json"):
    for r in json.load(open(f)):
        rows[(r["lib"], r["glitch"], r.get("batch", False), r.get("trace", "gru"), r["design"])] = r


def e(lib, gl, d, batch=False, trace="gru"):
    r = rows.get((lib, gl, batch, trace, d))
    return None if r is None else r["fJ_per_MAC"]


CASES = [("n45", False), ("n45", True), ("s130", False), ("s130", True)]
CN = {("n45", False): "N45 zero", ("n45", True): "N45 unit", ("s130", False): "S130 zero", ("s130", True): "S130 unit"}
CIM_FOR_K = {1: "dcim_g1", 4: "dcim_g1", 8: "dcim_g1", 16: "dcim_g2", 64: "dcim_g8"}
out = {"fJ_per_MAC": {}, "core_ratio_strongest": {}, "store_pJ_per_bit_equiv": {}, "system_ratio": {},
       "area_um2_per_MAC_per_cycle_n45": {}, "nic_saving_pct": {}, "gauss_sensitivity_n45_zero": {}}
for lib, gl in CASES:
    cn = CN[(lib, gl)]
    out["fJ_per_MAC"][cn] = {d: round(v, 1) for d in
                             ("ws_k1", "ws_k4", "ws_k8", "ws_k16", "ws_k64", "dcim_g1", "dcim_g2", "dcim_g8", "wsb_k1")
                             for v in [e(lib, gl, d)] if v}
    out["fJ_per_MAC"][cn].update({d + "_batched": round(v, 1) for d in ("ws_k4", "ws_k8", "ws_k16", "ws_k64")
                                  for v in [e(lib, gl, d, True)] if v})
    cr = {}
    for k, cim in CIM_FOR_K.items():
        base = [v for v in (e(lib, gl, f"ws_k{k}"), e(lib, gl, f"ws_k{k}", True)) if v]
        c = e(lib, gl, cim)
        if base and c:
            cr[f"k={k}"] = round(min(base) / c, 2)
    out["core_ratio_strongest"][cn] = cr
    if not gl:
        b1 = e(lib, gl, "ws_k1")
        out["store_pJ_per_bit_equiv"][cn] = {
            f"k={k}{' batched' if bt else ''}": round((e(lib, gl, f"ws_k{k}", bt) - b1) / 8 / 1000, 4)
            for k in (4, 8, 16, 64) for bt in (False, True) if e(lib, gl, f"ws_k{k}", bt)}

# system ratio at the NIC operating points (k = 3.4 -> k=4 data, k = 6.7 -> k=8 data)
for lib, gl in CASES:
    cn = CN[(lib, gl)]
    b1 = e(lib, gl, "ws_k1")
    for f, fl in ((0.39, "C heavy (pessimistic)"), (0.08, "C light (optimistic)")):
        for k, lab in ((4, "148.8 Mpps (k=3.4)"), (8, "75 Mpps (k=6.7)")):
            base = min(v for v in (e(lib, gl, f"ws_k{k}"), e(lib, gl, f"ws_k{k}", True)) if v)
            c = e(lib, gl, "dcim_g1")
            out["system_ratio"].setdefault(cn, {})[f"{lab}, {fl}"] = round((base + f * b1) / (c + f * b1), 2)
pess = out["system_ratio"]["N45 zero"]["148.8 Mpps (k=3.4), C heavy (pessimistic)"]
pess2 = out["system_ratio"]["N45 zero"]["75 Mpps (k=6.7), C heavy (pessimistic)"]
opt = max(out["system_ratio"]["S130 unit"].values())
out["corners"] = dict(pessimistic=min(pess, pess2), optimistic=opt,
                      note="pessimistic = Nangate45 zero-delay (no glitches) with heavy common terms; "
                           "optimistic = Sky130 unit-delay (glitch upper bound) with light common terms")

# area at equal throughput, Nangate45 logic (synthesis) + storage: latch 2.66 um^2 (DLH_X1) for the baseline store,
# 0.5-1.5 um^2 per bit for CIM bitcells [A]
area = {}
for f in glob.glob("syn/*_n45.log"):
    d = f.split("/")[-1].replace("_n45.log", "")
    for line in open(f):
        if "Chip area for module" in line:
            area[d] = float(line.split(":")[-1])
for k, g in ((1, 1), (4, 1), (8, 1), (16, 2), (64, 8)):
    if f"ws_k{k}" in area and f"dcim_g{g}" in area:
        b = area[f"ws_k{k}"] / 128 + 8 * k * 2.66
        c = [area[f"dcim_g{g}"] / 16 + 64 * g * a for a in (1.5, 0.5)]
        out["area_um2_per_MAC_per_cycle_n45"][f"k={k}"] = dict(baseline=round(b), cim=[round(x) for x in c],
                                                              baseline_over_cim=[round(b / x, 2) for x in c])

# NIC power: block power of the strongest baseline from the Phase 3 screen [P] and the system ratio corners
blocks = {"GRU H64 at 148.8 Mpps": (0.85, 1.31), "GRU H128 at 75 Mpps": (1.5, 2.3), "GRU H128 at 148.8 Mpps": (3.0, 4.6)}
for name, (lo, hi) in blocks.items():
    s_lo, s_hi = lo * (1 - 1 / out["corners"]["pessimistic"]), hi * (1 - 1 / out["corners"]["optimistic"])
    out["nic_saving_pct"][name] = dict(saving_W=[round(s_lo, 2), round(s_hi, 2)],
                                       pct_of_75_150W=[round(100 * s_lo / 150, 2), round(100 * s_hi / 75, 2)])

for d in ("ws_k1", "ws_k4", "ws_k8", "dcim_g1"):
    v = e("n45", False, d, trace="gauss")
    if v: out["gauss_sensitivity_n45_zero"][d] = round(v, 1)
for d in ("ws_k4", "ws_k8"):
    v = e("n45", False, d, True, "gauss")
    if v: out["gauss_sensitivity_n45_zero"][d + "_batched"] = round(v, 1)
g = out["gauss_sensitivity_n45_zero"]
if "dcim_g1" in g:
    out["gauss_sensitivity_n45_zero"]["ratios"] = {
        "k=1": round(g["ws_k1"] / g["dcim_g1"], 2),
        "k=4": round(min(g["ws_k4"], g["ws_k4_batched"]) / g["dcim_g1"], 2),
        "k=8": round(min(g["ws_k8"], g["ws_k8_batched"]) / g["dcim_g1"], 2)}
json.dump(out, open("results/summary_nic.json", "w"), indent=1)
print(json.dumps(out, indent=1))
