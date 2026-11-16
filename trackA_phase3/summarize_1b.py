"""Collect results/*.json into a table and ratios (baseline / DCIM). Writes results/summary_1b.json."""
import json, glob
rows = {}
for f in glob.glob("results/power_*.json"):
    R = 256 if "R256" in f else 64
    for r in json.load(open(f)):
        lib = r["lib"].replace("R256", "")
        rows[(lib, r["glitch"], r["trace"], R, r["design"])] = r
def e(lib, gl, d, R=64, tr="k80_0dB"):
    r = rows.get((lib, gl, tr, R, d)); return None if r is None else r["fJ_per_MAC"]
out = {"fJ_per_MAC": {}, "ratios": {}, "breakdown_n45_zero": {}, "leak_fJ_per_MAC_500MHz_n45": {}}
cases = [("n45", False), ("n45", True), ("s130", False), ("s130", True)]
for d in ("sgn_tree", "sgn_tree_ni", "and_tree_ni", "dcim", "dcim_bp", "dcim_sm_bp"):
    out["fJ_per_MAC"][d] = {f"{l}_{'unit' if g else 'zero'}": (round(e(l, g, d), 1) if e(l, g, d) else None) for l, g in cases}
    r = rows.get(("n45", False, "k80_0dB", 64, d))
    out["breakdown_n45_zero"][d] = {k: round(v, 1) for k, v in r["breakdown_fJ_per_MAC"].items()}
    out["leak_fJ_per_MAC_500MHz_n45"][d] = round(r["leak_fJ_per_MAC_at_500MHz"], 2)
for b, c in (("and_tree_ni", "dcim_bp"), ("and_tree_ni", "dcim"), ("and_tree_ni", "dcim_sm_bp"),
             ("sgn_tree_ni", "dcim_bp"), ("sgn_tree", "dcim")):
    out["ratios"][f"{b} / {c}"] = {f"{l}_{'unit' if g else 'zero'}": round(e(l, g, b) / e(l, g, c), 2) for l, g in cases}
out["R256_zero"] = {l: {d: round(e(l, False, d, 256), 1) for d in ("and_tree_ni", "dcim_bp", "dcim")} for l in ("n45", "s130")}
out["R256_ratio_and_over_dcim_bp"] = {l: round(e(l, False, "and_tree_ni", 256) / e(l, False, "dcim_bp", 256), 2) for l in ("n45", "s130")}
out["second_trace_k40_m5dB_n45_zero"] = {d: round(e("n45", False, d, 64, "k40_m5dB"), 1) for d in ("and_tree_ni", "dcim_bp", "dcim")}
json.dump(out, open("results/summary_1b.json", "w"), indent=1)
print(json.dumps(out, indent=1))
