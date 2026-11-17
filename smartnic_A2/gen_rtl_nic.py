"""SmartNIC GRU cores: weight-stationary adder-tree array with a K-entry weight store per multiplier vs digital CIM.

Same tree, pipeline stage and port conventions as D:\\nycu\\phase1_dcim\\killtest\\gen_rtl.py. 8-bit signed
weights x 8-bit signed activations (GRU hidden state), R rows x C columns.

ws_k{K}   : baseline. Each PE holds K weights (K output columns time-shared on one multiplier) and reads one per
            cycle through a K:1 select (the read path of a K-entry standard-cell register file). The input
            vector is held for K cycles. K = 1 is the hardwired weight-register array (k <= 1 case).
            Weights are module ports (the storage itself does not toggle; its leakage and area are added
            analytically). sel is shared by all PEs.
dcim_g{G} : digital CIM column slice, bit-plane inputs straight from the buffer (most favourable to CIM),
            8 planes MSB first (two's complement, MSB plane negative). Each cell position holds G weights
            (G column groups share one adder tree via a G:1 select, as in macros with more weight columns
            than adder trees). Input planes are replayed for each group.
usage: python gen_rtl_nic.py R C OUTDIR
"""
import sys, math

R = int(sys.argv[1]) if len(sys.argv) > 1 else 64
C = int(sys.argv[2]) if len(sys.argv) > 2 else 2
OUT = sys.argv[3] if len(sys.argv) > 3 else "rtl"
BW = BX = 8
ACC = math.ceil(math.log2(R * 128 * 128)) + 1
PIPE_LVL = 3


def tree(prefix, leaves, w0, lines, regs, pipe=None):
    pipe = PIPE_LVL if pipe is None else pipe
    lvl, w, cur = 0, w0, list(leaves)
    while len(cur) > 1:
        nxt, w2 = [], w + 1
        for i in range(0, len(cur), 2):
            n = f"{prefix}_l{lvl}_{i//2}"
            lines.append(f"  wire signed [{w2-1}:0] {n};")
            lines.append(f"  assign {n} = $signed({cur[i]}) + $signed({cur[i+1]});" if i + 1 < len(cur)
                         else f"  assign {n} = $signed({cur[i]});")
            nxt.append(n)
        cur, w, lvl = nxt, w2, lvl + 1
        if lvl == pipe and len(cur) > 1:
            piped = []
            for n in cur:
                rn = n + "_r"
                lines.append(f"  reg signed [{w-1}:0] {rn};")
                regs.append(f"    {rn} <= {n};")
                piped.append(rn)
            cur = piped
    return cur[0], w


def wsel(name, K, selname):
    """K:1 select of an 8-bit field from a packed port; returns (lines, expr)."""
    if K == 1:
        return [], name
    return [], f"{name}[{selname}*{BW} +: {BW}]"


def ws_k(K):
    sb = max(1, math.ceil(math.log2(K)))
    ports = ["input clk"] + ([f"input [{sb-1}:0] sel"] if K > 1 else [])
    ports += [f"input signed [{BX-1}:0] x_{r}" for r in range(R)]
    ports += [f"input [{BW*K-1}:0] wv_{r}_{c}" for r in range(R) for c in range(C)]
    ports += [f"output signed [{ACC-1}:0] y_{c}" for c in range(C)]
    L = [f"module ws_k{K} (", "  " + ",\n  ".join(ports), ");"]
    regs = []
    for c in range(C):
        leaves = []
        for r in range(R):
            _, e = wsel(f"wv_{r}_{c}", K, "sel")
            L.append(f"  wire signed [{BW-1}:0] w_{r}_{c} = {e};")
            L.append(f"  wire signed [{BW+BX-1}:0] pr_{r}_{c} = w_{r}_{c} * x_{r};")
            leaves.append(f"pr_{r}_{c}")
        top, _ = tree(f"t{c}", leaves, BW + BX, L, regs)
        L.append(f"  reg signed [{ACC-1}:0] yo_{c};")
        regs.append(f"    yo_{c} <= {top};")
        L.append(f"  assign y_{c} = yo_{c};")
    L += ["  always @(posedge clk) begin"] + regs + ["  end", "endmodule"]
    return "\n".join(L)


def wsb_k(K):
    """Strong baseline: radix-4 Booth encoding of each input (4 digits, encoder shared by all C columns and all
    K cycles of a row), Booth partial-product selectors per PE, and all 4 partial products of all R rows fused
    into one adder tree per column (no separate multipliers). K-entry weight store as in ws_k."""
    sb = max(1, math.ceil(math.log2(K)))
    ports = ["input clk"] + ([f"input [{sb-1}:0] sel"] if K > 1 else [])
    ports += [f"input signed [{BX-1}:0] x_{r}" for r in range(R)]
    ports += [f"input [{BW*K-1}:0] wv_{r}_{c}" for r in range(R) for c in range(C)]
    ports += [f"output signed [{ACC-1}:0] y_{c}" for c in range(C)]
    L = [f"module wsb_k{K} (", "  " + ",\n  ".join(ports), ");"]
    regs = []
    for r in range(R):
        L.append(f"  wire [8:0] xe_{r} = {{x_{r}, 1'b0}};")
        for i in range(4):
            L.append(f"  wire [2:0] bd_{r}_{i} = xe_{r}[{2*i+2}:{2*i}];")
            L.append(f"  wire one_{r}_{i} = bd_{r}_{i}[0] ^ bd_{r}_{i}[1];")
            L.append(f"  wire two_{r}_{i} = (bd_{r}_{i} == 3'b011) | (bd_{r}_{i} == 3'b100);")
            L.append(f"  wire neg_{r}_{i} = bd_{r}_{i}[2] & ~(bd_{r}_{i}[1] & bd_{r}_{i}[0]);")
    for c in range(C):
        leaves = []
        for r in range(R):
            _, e = wsel(f"wv_{r}_{c}", K, "sel")
            L.append(f"  wire signed [{BW-1}:0] w_{r}_{c} = {e};")
            for i in range(4):
                m = f"m_{r}_{c}_{i}"; p = f"pp_{r}_{c}_{i}"
                L.append(f"  wire signed [9:0] {m} = one_{r}_{i} ? $signed(w_{r}_{c}) : (two_{r}_{i} ? $signed({{w_{r}_{c}, 1'b0}}) : 10'sd0);")
                L.append(f"  wire signed [{9 + 2*i}:0] {p} = (neg_{r}_{i} ? -{m} : {m}) <<< {2*i};")
                leaves.append(p)
        top, _ = tree(f"t{c}", leaves, 16, L, regs, pipe=PIPE_LVL + 2)   # 4x more leaves: same register position
        L.append(f"  reg signed [{ACC-1}:0] yo_{c};")
        regs.append(f"    yo_{c} <= {top};")
        L.append(f"  assign y_{c} = yo_{c};")
    L += ["  always @(posedge clk) begin"] + regs + ["  end", "endmodule"]
    return "\n".join(L)


def dcim_g(G):
    sb = max(1, math.ceil(math.log2(G)))
    ports = ["input clk", "input first"] + ([f"input [{sb-1}:0] gsel"] if G > 1 else [])
    ports += [f"input b_{r}" for r in range(R)]
    ports += [f"input [{BW*G-1}:0] wv_{r}_{c}" for r in range(R) for c in range(C)]
    ports += [f"output signed [{ACC-1}:0] y_{c}" for c in range(C)]
    L = [f"module dcim_g{G} (", "  " + ",\n  ".join(ports), ");"]
    regs = []
    for c in range(C):
        leaves = []
        for r in range(R):
            _, e = wsel(f"wv_{r}_{c}", G, "gsel")
            L.append(f"  wire signed [{BW-1}:0] w_{r}_{c} = {e};")
            L.append(f"  wire signed [{BW-1}:0] pp_{r}_{c} = b_{r} ? w_{r}_{c} : {BW}'sd0;")
            leaves.append(f"pp_{r}_{c}")
        top, _ = tree(f"t{c}", leaves, BW, L, regs)
        L.append(f"  reg signed [{ACC-1}:0] acc_{c};")
        regs.append(f"    acc_{c} <= first ? -$signed({top}) : (acc_{c} <<< 1) + $signed({top});")
        L.append(f"  assign y_{c} = acc_{c};")
    L += ["  always @(posedge clk) begin"] + regs + ["  end", "endmodule"]
    return "\n".join(L)


KS = (1, 4, 8, 16, 64)
GS = (1, 2, 8)
if __name__ == "__main__":
    for K in KS:
        open(f"{OUT}/ws_k{K}_R{R}C{C}.v", "w").write(ws_k(K))
    for K in KS:
        open(f"{OUT}/wsb_k{K}_R{R}C{C}.v", "w").write(wsb_k(K))
    for G in GS:
        open(f"{OUT}/dcim_g{G}_R{R}C{C}.v", "w").write(dcim_g(G))
    print("written R", R, "C", C, "ACC", ACC)
