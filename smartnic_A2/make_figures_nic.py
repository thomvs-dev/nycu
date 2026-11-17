"""Figures for the SmartNIC GRU test, from results/summary_nic.json. usage: python make_figures_nic.py OUTDIR"""
import json, sys, os
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

OUT = sys.argv[1] if len(sys.argv) > 1 else "figures"
os.makedirs(OUT, exist_ok=True)
SURF, INK, INK2, GRID = "#fcfcfb", "#0b0b0b", "#52514e", "#e4e3df"
S = ["#2a78d6", "#eb6834", "#1baf7a", "#eda100"]           # categorical slots 1-4, fixed order
plt.rcParams.update({"figure.facecolor": SURF, "axes.facecolor": SURF, "savefig.facecolor": SURF,
                     "axes.edgecolor": GRID, "axes.labelcolor": INK2, "xtick.color": INK2, "ytick.color": INK2,
                     "text.color": INK, "font.size": 10, "axes.spines.top": False, "axes.spines.right": False,
                     "axes.grid": True, "grid.color": GRID, "grid.linewidth": 0.6, "axes.axisbelow": True})
D = json.load(open("results/summary_nic.json"))

# ---- Fig 1: core ratio vs k, four library / glitch cases
fig, ax = plt.subplots(figsize=(8, 4.3))
order = [("N45 zero", "Nangate45, no glitches (pessimistic)"), ("S130 zero", "Sky130, no glitches"),
         ("N45 unit", "Nangate45, glitch upper bound"), ("S130 unit", "Sky130, glitch upper bound (optimistic)")]
for i, (cn, lab) in enumerate(order):
    cr = D["core_ratio_strongest"][cn]
    ks = sorted(int(k.split("=")[1]) for k in cr)
    v = [cr[f"k={k}"] for k in ks]
    ax.plot(ks, v, color=S[i], lw=2, marker="o", ms=6, label=lab)
    ax.annotate(f"{v[-1]:.2f}", (ks[-1], v[-1]), xytext=(6, 8 if abs(v[-1] - 1.3) < 0.04 else 0), textcoords="offset points", va="center", fontsize=8.5, color=INK2)
ax.axvspan(3.4, 6.7, color="#e4e3df", alpha=0.6, lw=0)
ax.text(4.75, 0.74, "NIC operating\nrange (75–149 Mpps)", ha="center", va="bottom", fontsize=8.5, color=INK2)
ax.axhline(1.3, color=INK, lw=1.2, ls="--"); ax.text(70, 1.32, "1.3× go threshold", ha="right", va="bottom", fontsize=8.5)
ax.axhline(1.0, color=INK2, lw=1, ls=":")
ax.set_xscale("log", base=2); ax.set_xticks([1, 4, 8, 16, 64], ["1", "4", "8", "16", "64"]); ax.set_xlim(0.8, 90)
ax.set_ylim(0.7, 2.6)
ax.set_xlabel("k = clock cycles per packet (500 MHz engine)")
ax.set_ylabel("Strongest digital baseline ÷ digital CIM\n(core energy per MAC)")
ax.set_title("SmartNIC GRU: digital CIM gain vs cycles per packet", loc="left", fontsize=11)
ax.legend(frameon=False, fontsize=8.5, loc="upper right")
fig.tight_layout(); fig.savefig(f"{OUT}/fig5_nic_ratio_vs_k.png", dpi=160); plt.close(fig)

# ---- Fig 2: energy per MAC, Nangate45 zero-delay
E = D["fJ_per_MAC"]["N45 zero"]
ks = [1, 4, 8, 16]
cim = {1: "dcim_g1", 4: "dcim_g1", 8: "dcim_g1", 16: "dcim_g2"}
fig, ax = plt.subplots(figsize=(8, 4.2))
x = np.arange(len(ks)); w = 0.26
ser = [("Baseline, weight switches every cycle", [E[f"ws_k{k}"] for k in ks], S[0]),
       ("Baseline, k packets batched (weight held k cycles)", [E.get(f"ws_k{k}_batched", E[f"ws_k{k}"]) for k in ks], S[1]),
       ("Digital CIM, bit-plane", [E[cim[k]] for k in ks], S[2])]
for i, (lab, v, col) in enumerate(ser):
    rects = ax.bar(x + (i - 1) * (w + 0.02), v, w, color=col, label=lab, edgecolor=SURF, linewidth=2)
    for r in rects:
        ax.annotate(f"{r.get_height():.0f}", (r.get_x() + r.get_width() / 2, r.get_height()), xytext=(0, 2),
                    textcoords="offset points", ha="center", va="bottom", fontsize=8, color=INK2)
ax.set_xticks(x, [f"k = {k}" + (" (hardwired)" if k == 1 else "") for k in ks])
ax.set_ylabel("Energy per MAC (fJ), lower is better"); ax.set_ylim(0, 1550)
ax.set_title("SmartNIC GRU: energy per MAC, 8-bit × 8-bit, Nangate45 no-glitch (pessimistic case)", loc="left", fontsize=11)
ax.legend(frameon=False, fontsize=8.5, loc="upper left"); ax.grid(axis="x", visible=False)
fig.tight_layout(); fig.savefig(f"{OUT}/fig6_nic_energy_per_mac.png", dpi=160); plt.close(fig)

# ---- Fig 3: measured weight-store cost vs the assumed B2 band
P = D["store_pJ_per_bit_equiv"]
fig, ax = plt.subplots(figsize=(8, 3.8))
labels, vals, cols = [], [], []
for cn, col, short in (("N45 zero", S[0], "N45"), ("S130 zero", S[1], "S130")):
    for k in (4, 8, 16):
        for bt in (False, True):
            key = f"k={k}{' batched' if bt else ''}"
            if key in P[cn]:
                labels.append(f"{short}\nk={k}{' b' if bt else ''}"); vals.append(P[cn][key] * 1000); cols.append(col)
xx = np.arange(len(vals))
bars = ax.bar(xx, vals, 0.6, color=cols, edgecolor=SURF, linewidth=2, zorder=3)
for r in bars:
    ax.annotate(f"{r.get_height():.0f}", (r.get_x() + r.get_width() / 2, r.get_height()), xytext=(0, 2),
                textcoords="offset points", ha="center", va="bottom", fontsize=8, color=INK2)
ax.axhspan(20, 50, color=S[3], alpha=0.18, lw=0, zorder=0)
ax.set_xticks(xx, labels, fontsize=8); ax.set_ylabel("Weight-store read cost\n(fJ per weight bit)")
ax.set_title("Measured cost of the k-entry weight store ('b' = batched; not node-scaled)", loc="left", fontsize=11)
from matplotlib.patches import Patch
ax.legend(handles=[Patch(color=S[0], label="Nangate45 (45 nm, 1.1 V)"), Patch(color=S[1], label="Sky130 (130 nm, 1.8 V)"),
                   Patch(color=S[3], alpha=0.3, label="Phase 3 assumption B2: 20–50 fJ/bit at 22 nm (unsourced)")],
          frameon=False, fontsize=8.5, loc="upper left")
ax.grid(axis="x", visible=False)
fig.tight_layout(); fig.savefig(f"{OUT}/fig7_nic_store_cost.png", dpi=160); plt.close(fig)
print("figures written to", OUT)
