"""Track A 1-bit-weight cores for the DCIM-vs-digital synthesis test.

Extends D:\\nycu\\phase1_dcim\\killtest\\gen_rtl.py (same balanced adder tree, same pipeline stage after
3 tree levels, same port conventions). Weights are +/-1 pilot entries stored as one bit
(w = 1 -> +1, w = 0 -> -1), held constant at the module ports (storage outside the compared logic).
Inputs are 6-bit two's-complement AMP residuals (-31..31). R rows x C columns.

Baselines
  sgn_tree    : input regs; leaf = w ? x : -x (7 b); adder tree; out reg.          y = sum s*x
  sgn_tree_ni : same, no input regs.                                               y = sum s*x
  and_tree_ni : leaf = w ? x : 0 (6 b); adder tree; out reg; no input regs.        y = P = sum w*x
                (sum s*x = 2P - sum x; sum x is shared by all 2048 pilot columns, and the final
                 shift-subtract is one op per column per vector on BOTH and_tree and DCIM, so it is
                 a common term outside the compared logic)
Digital CIM (Chih ISSCC 2021 style, bit-serial inputs, MSB first, two's complement)
  dcim        : per-row 6 b shift reg; leaf = in_bit AND w (1 b); popcount tree; shift-acc
                with the MSB plane negative.                                        y = P
  dcim_bp     : same, bit-planes straight from a bit-transposed buffer (no shift regs).  y = P
usage: python gen_rtl_1b.py R C OUTDIR
"""
import sys

R = int(sys.argv[1]) if len(sys.argv) > 1 else 64
C = int(sys.argv[2]) if len(sys.argv) > 2 else 2
OUT = sys.argv[3] if len(sys.argv) > 3 else "rtl"
import math
BX = 6
ACC = max(13, math.ceil(math.log2(R * 31)) + 2)
PIPE_LVL = 3


def tree(prefix, leaves, w0, lines, regs):
    lvl, w, cur = 0, w0, list(leaves)
    while len(cur) > 1:
        nxt, w2 = [], w + 1
        for i in range(0, len(cur), 2):
            n = f"{prefix}_l{lvl}_{i//2}"
            lines.append(f"  wire signed [{w2-1}:0] {n};")
            if i + 1 < len(cur):
                lines.append(f"  assign {n} = $signed({cur[i]}) + $signed({cur[i+1]});")
            else:
                lines.append(f"  assign {n} = $signed({cur[i]});")
            nxt.append(n)
        cur, w, lvl = nxt, w2, lvl + 1
        if lvl == PIPE_LVL and len(cur) > 1:
            piped = []
            for n in cur:
                rn = n + "_r"
                lines.append(f"  reg signed [{w-1}:0] {rn};")
                regs.append(f"    {rn} <= {n};")
                piped.append(rn)
            cur = piped
    return cur[0], w


def header(name, extra):
    ports = ["input clk"] + extra
    ports += [f"input w_{r}_{c}" for r in range(R) for c in range(C)]
    ports += [f"output signed [{ACC-1}:0] y_{c}" for c in range(C)]
    return [f"module {name} (", "  " + ",\n  ".join(ports), ");"]


def par_tree(name, inregs, mode):
    L = header(name, [f"input signed [{BX-1}:0] x_{r}" for r in range(R)])
    regs = []
    xs = []
    for r in range(R):
        if inregs:
            L.append(f"  reg signed [{BX-1}:0] xr_{r};")
            regs.append(f"    xr_{r} <= x_{r};")
            xs.append(f"xr_{r}")
        else:
            xs.append(f"x_{r}")
    for c in range(C):
        leaves = []
        for r in range(R):
            n = f"pr_{r}_{c}"
            if mode == "sgn":
                L.append(f"  wire signed [{BX}:0] {n} = w_{r}_{c} ? $signed({xs[r]}) : -$signed({xs[r]});")
                w0 = BX + 1
            else:
                L.append(f"  wire signed [{BX-1}:0] {n} = w_{r}_{c} ? {xs[r]} : {BX}'sd0;")
                w0 = BX
            leaves.append(n)
        top, _ = tree(f"t{c}", leaves, w0, L, regs)
        L.append(f"  reg signed [{ACC-1}:0] yo_{c};")
        regs.append(f"    yo_{c} <= {top};")
        L.append(f"  assign y_{c} = yo_{c};")
    L += ["  always @(posedge clk) begin"] + regs + ["  end", "endmodule"]
    return "\n".join(L)


def dcim(name, bp):
    if bp:
        L = header(name, ["input first"] + [f"input b_{r}" for r in range(R)])
    else:
        L = header(name, ["input load", "input first"] + [f"input [{BX-1}:0] x_{r}" for r in range(R)])
    regs = []
    if not bp:
        for r in range(R):
            L.append(f"  reg [{BX-1}:0] sr_{r};")
            regs.append(f"    sr_{r} <= load ? x_{r} : {{sr_{r}[{BX-2}:0], 1'b0}};")
            L.append(f"  wire b_{r} = sr_{r}[{BX-1}];")
    for c in range(C):
        leaves = []
        for r in range(R):
            n = f"pp_{r}_{c}"
            L.append(f"  wire signed [1:0] {n} = {{1'b0, b_{r} & w_{r}_{c}}};")
            leaves.append(n)
        top, _ = tree(f"t{c}", leaves, 2, L, regs)
        L.append(f"  reg signed [{ACC-1}:0] acc_{c};")
        regs.append(f"    acc_{c} <= first ? -$signed({top}) : (acc_{c} <<< 1) + $signed({top});")
        L.append(f"  assign y_{c} = acc_{c};")
    L += ["  always @(posedge clk) begin"] + regs + ["  end", "endmodule"]
    return "\n".join(L)


def dcim_sm_bp(name):
    """Sign-magnitude inputs: 5 magnitude bit-planes (MSB first) from the buffer, plus the row's sign bit
    (constant over the 5 planes). leaf = (mag_bit AND w) ? (sign ? -1 : +1) : 0, 2-bit signed popcount tree."""
    L = header(name, ["input first"] + [f"input b_{r}" for r in range(R)] + [f"input g_{r}" for r in range(R)])
    regs = []
    for c in range(C):
        leaves = []
        for r in range(R):
            n = f"pp_{r}_{c}"
            L.append(f"  wire a_{r}_{c} = b_{r} & w_{r}_{c};")
            L.append(f"  wire signed [1:0] {n} = {{a_{r}_{c} & g_{r}, a_{r}_{c}}};")
            leaves.append(n)
        top, _ = tree(f"t{c}", leaves, 2, L, regs)
        L.append(f"  reg signed [{ACC-1}:0] acc_{c};")
        regs.append(f"    acc_{c} <= first ? $signed({top}) : (acc_{c} <<< 1) + $signed({top});")
        L.append(f"  assign y_{c} = acc_{c};")
    L += ["  always @(posedge clk) begin"] + regs + ["  end", "endmodule"]
    return "\n".join(L)


DESIGNS = {
    "sgn_tree": lambda: par_tree("sgn_tree", True, "sgn"),
    "sgn_tree_ni": lambda: par_tree("sgn_tree_ni", False, "sgn"),
    "and_tree_ni": lambda: par_tree("and_tree_ni", False, "and"),
    "dcim": lambda: dcim("dcim", False),
    "dcim_bp": lambda: dcim("dcim_bp", True),
    "dcim_sm_bp": lambda: dcim_sm_bp("dcim_sm_bp"),
}

if __name__ == "__main__":
    for n, f in DESIGNS.items():
        open(f"{OUT}/{n}_R{R}C{C}.v", "w").write(f())
    print("written R", R, "C", C)
