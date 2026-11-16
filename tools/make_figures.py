"""Make the README figures from the committed result JSON files.
usage (from the repo root): python tools/make_figures.py"""
import json, os
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

SURF, INK, INK2, GRID = "#fcfcfb", "#0b0b0b", "#52514e", "#e4e3df"
S1, S2, S3 = "#2a78d6", "#eb6834", "#1baf7a"          # categorical slots 1-3 (validated, light)
plt.rcParams.update({"figure.facecolor": SURF, "axes.facecolor": SURF, "savefig.facecolor": SURF,
                     "axes.edgecolor": GRID, "axes.labelcolor": INK2, "xtick.color": INK2, "ytick.color": INK2,
                     "text.color": INK, "font.size": 10, "axes.spines.top": False, "axes.spines.right": False,
                     "axes.grid": True, "grid.color": GRID, "grid.linewidth": 0.6, "axes.axisbelow": True})

S = json.load(open("trackA_phase3/results/summary_1b.json"))
CASES = ["n45_zero", "n45_unit", "s130_zero", "s130_unit"]
LAB = ["Nangate45\nzero-delay", "Nangate45\nunit-delay", "Sky130\nzero-delay", "Sky130\nunit-delay"]
OUT = "trackA_phase3/figures"


def bar_label(ax, rects, fmt="{:.0f}"):
    for r in rects:
        ax.annotate(fmt.format(r.get_height()), (r.get_x() + r.get_width() / 2, r.get_height()),
                    xytext=(0, 2), textcoords="offset points", ha="center", va="bottom", fontsize=8, color=INK2)


# ---- Fig 1: energy per MAC
fig, ax = plt.subplots(figsize=(8, 4.2))
x = np.arange(4); w = 0.26
series = [("and_tree_ni", "Ordinary digital (shared-sum adder tree)", S1),
          ("dcim_bp", "Digital CIM, bit-plane inputs (CIM-favourable)", S2),
          ("dcim", "Digital CIM, shift-register inputs", S3)]
for i, (k, name, col) in enumerate(series):
    v = [S["fJ_per_MAC"][k][c] for c in CASES]
    rects = ax.bar(x + (i - 1) * (w + 0.02), v, w, color=col, label=name, edgecolor=SURF, linewidth=2)
    bar_label(ax, rects)
ax.set_xticks(x, LAB); ax.set_ylabel("Energy per MAC (fJ), lower is better")
ax.set_title("Track A: energy per MAC, 1-bit pilots × 6-bit AMP inputs (64×2 tile)", loc="left", fontsize=11)
ax.legend(frameon=False, fontsize=8.5, loc="upper left")
ax.grid(axis="x", visible=False)
fig.tight_layout(); fig.savefig(f"{OUT}/fig1_energy_per_mac.png", dpi=160); plt.close(fig)

# ---- Fig 2: ratio vs threshold
fig, ax = plt.subplots(figsize=(8, 4.2))
strong = [S["ratios"]["and_tree_ni / dcim_bp"][c] for c in CASES]
naive = [S["ratios"]["sgn_tree_ni / dcim_bp"][c] for c in CASES]
r1 = ax.bar(x - 0.15, strong, 0.28, color=S1, label="vs ordinary digital with shared-sum trick (strongest)", edgecolor=SURF, linewidth=2)
r2 = ax.bar(x + 0.15, naive, 0.28, color=S2, label="vs naive sign-select adder tree", edgecolor=SURF, linewidth=2)
bar_label(ax, r1, "{:.2f}"); bar_label(ax, r2, "{:.2f}")
ax.axhline(1.0, color=INK2, lw=1, ls=":")
ax.axhline(1.3, color=INK, lw=1.2, ls="--")
ax.text(3.98, 1.32, "1.3× go threshold", va="bottom", ha="right", fontsize=8.5, color=INK)
ax.text(3.98, 1.02, "parity", va="bottom", ha="right", fontsize=8.5, color=INK2)
ax.set_xticks(x, LAB); ax.set_xlim(-0.5, 4.0); ax.set_ylim(0, 2.0)
ax.set_ylabel("Baseline energy ÷ digital-CIM energy\n(above 1 = CIM better)")
ax.set_title("Track A: digital CIM (bit-plane) never reaches 1.3× against a competent digital design", loc="left", fontsize=11, pad=28)
ax.legend(frameon=False, fontsize=8.5, loc="lower left", bbox_to_anchor=(0, 1.0), ncol=2)
ax.grid(axis="x", visible=False)
fig.tight_layout(); fig.savefig(f"{OUT}/fig2_ratio_vs_threshold.png", dpi=160); plt.close(fig)

# ---- Fig 3: logic vs clock breakdown (N45, zero delay)
B = S["breakdown_n45_zero"]
def split(d):
    b = B[d]; clk = b["clk_pin_internal"] + b["clk_net"]; return sum(b.values()) - clk, clk
fig, ax = plt.subplots(figsize=(8, 3.2))
names = [("dcim_bp", "Digital CIM (bit-plane)"), ("and_tree_ni", "Ordinary digital (shared sum)")]
for i, (k, lab) in enumerate(names):
    lg, ck = split(k)
    ax.barh(i, lg, 0.5, color=S1, edgecolor=SURF, linewidth=2, label="Logic (switching + internal)" if i == 0 else None)
    ax.barh(i, ck, 0.5, left=lg, color=S2, edgecolor=SURF, linewidth=2, label="Clock (flop pins + clock net)" if i == 0 else None)
    ax.text(lg / 2, i, f"{lg:.0f}", ha="center", va="center", color="white", fontsize=9)
    ax.text(lg + ck / 2, i, f"{ck:.0f}", ha="center", va="center", color="white", fontsize=9)
    ax.text(lg + ck + 1.5, i, f"{lg + ck:.0f} fJ", va="center", fontsize=9, color=INK)
ax.set_yticks([0, 1], [n[1] for n in names]); ax.set_xlabel("fJ per MAC (Nangate45, zero-delay)")
ax.set_xlim(0, 125); ax.grid(axis="y", visible=False)
ax.set_title("Why: the logic ties; CIM pays the clock once per input bit-plane", loc="left", fontsize=11)
ax.legend(frameon=False, fontsize=8.5, loc="upper center", ncol=2, bbox_to_anchor=(0.5, -0.32))
fig.tight_layout(); fig.savefig(f"{OUT}/fig3_logic_vs_clock.png", dpi=160); plt.close(fig)

# ---- Fig 4: Phase 4 RRAM reuse-per-wake criterion (pessimistic corner)
P = json.load(open("phase4/screen_phase4_axes.json"))["axis2_sweep_1Mb"]
fig, ax = plt.subplots(figsize=(8, 4.2))
for rw, col in ((1, S1), (10, S2), (100, S3)):
    pts = sorted((r["T_s"], r["PES"]["ratio"]) for r in P if r["R_w"] == rw)
    t, v = zip(*pts)
    ax.plot(t, v, color=col, lw=2, marker="o", ms=6, label=f"R_w = {rw} MACs per weight per wake")
    ax.annotate(f"{v[-1]:.2f}×", (t[-1], v[-1]), xytext=(6, 0), textcoords="offset points", va="center", fontsize=8.5, color=INK2)
ax.set_xscale("log"); ax.set_xlim(0.006, 3000)
ax.axhline(1.3, color=INK, lw=1.2, ls="--"); ax.text(0.007, 1.38, "1.3× go threshold", fontsize=8.5)
ax.axhline(1.0, color=INK2, lw=1, ls=":")
ax.set_xlabel("Sleep interval between inferences T (s)")
ax.set_ylabel("Best digital baseline ÷ RRAM CIM\n(pessimistic corner, 1 Mb model)")
ax.set_title("Phase 4: RRAM CIM wins only with low reuse per wake and long sleep", loc="left", fontsize=11)
ax.legend(frameon=False, fontsize=8.5, loc="center right", bbox_to_anchor=(1, 0.62))
fig.tight_layout(); fig.savefig("phase4/figures/fig4_rram_reuse_per_wake.png", dpi=160); plt.close(fig)
print("figures written")
