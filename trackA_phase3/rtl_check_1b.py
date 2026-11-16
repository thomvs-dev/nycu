"""Icarus RTL check of the 1-bit Track A cores against numpy, on real Track A operands.
usage: python rtl_check_1b.py R C"""
import sys, subprocess, numpy as np
R = int(sys.argv[1]) if len(sys.argv) > 1 else 64
C = int(sys.argv[2]) if len(sys.argv) > 2 else 2
N = 40
t = np.load("data/trackA_traces.npz")
X = t["X_k80_0dB"][200:200 + N, :R].astype(int)                 # N vectors, R rows
Wb = t["Wbits"][:R, 100:100 + C].astype(int)
P = X @ Wb                                                         # sum w*x, w in {0,1}
Sg = X @ (2 * Wb - 1)                                              # sum s*x
X6 = X & 63


def stim(design):
    """per-cycle input values (list of dict) for design"""
    cyc = []
    if design in ("sgn_tree", "sgn_tree_ni", "and_tree_ni"):
        for k in range(N + 6):
            cyc.append({f"x_{r}": (X6[k, r] if k < N else 0) for r in range(R)})
    elif design == "dcim":
        for k in range(6 * N + 12):
            n = k // 6
            d = {f"x_{r}": (X6[n, r] if n < N else 0) for r in range(R)}
            d["load"] = int(k % 6 == 0); d["first"] = int(k % 6 == 2)
            cyc.append(d)
    else:
        for k in range(6 * N + 12):
            n, j = (k - 1) // 6, (k - 1) % 6
            d = {f"b_{r}": (int((X6[n, r] >> (5 - j)) & 1) if (0 <= n < N and k >= 1) else 0) for r in range(R)}
            d["first"] = int(k % 6 == 2)
            cyc.append(d)
    return cyc


def tb(design, cyc):
    names = list(cyc[0].keys())
    widths = {n: (6 if n.startswith("x_") else 1) for n in names}
    L = ["`timescale 1ns/1ps", "module tb;", "reg clk=0; always #1 clk=~clk;"]
    L += [f"reg [{widths[n]-1}:0] {n};" for n in names]
    L += [f"wire signed [12:0] y_{c};" for c in range(C)]
    conn = [f".{n}({n})" for n in names] + [f".w_{r}_{c}(1'b{Wb[r, c]})" for r in range(R) for c in range(C)]
    conn += [f".y_{c}(y_{c})" for c in range(C)]
    L.append(f"{design} dut(.clk(clk), {', '.join(conn)});")
    tot = sum(widths.values())
    L.append(f"reg [{tot-1}:0] mem [0:{len(cyc)-1}];")
    L.append(f'initial $readmemb("sim/{design}.stim", mem);')
    L.append("integer k; initial begin #0.2;")
    L.append(f"for (k=0;k<{len(cyc)};k=k+1) begin")
    L.append("  {" + ", ".join(names) + "} = mem[k]; @(posedge clk); #0.1;")
    L.append('  $display("%0d ' + " ".join(["%0d"] * C) + '", k, ' + ", ".join(f"y_{c}" for c in range(C)) + ");")
    L.append("end $finish; end endmodule")
    with open(f"sim/{design}.stim", "w") as f:
        for d in cyc:
            f.write("".join(format(int(d[n]), f"0{widths[n]}b") for n in names) + "\n")
    return "\n".join(L)


ok = True
for d in ("sgn_tree", "sgn_tree_ni", "and_tree_ni", "dcim", "dcim_bp"):
    cyc = stim(d)
    open(f"sim/tb_{d}.v", "w").write(tb(d, cyc))
    subprocess.run(["iverilog", "-Wnone", "-o", f"sim/{d}.vvp", f"sim/tb_{d}.v", f"rtl/{d}_R{R}C{C}.v"], check=True)
    out = subprocess.run(["vvp", f"sim/{d}.vvp"], capture_output=True, text=True).stdout.split("\n")
    rows = {int(l.split()[0]): [int(v) if v.lstrip('-').isdigit() else None for v in l.split()[1:]]
            for l in out if l and l[0].isdigit()}
    ref = Sg if d.startswith("sgn") else P
    step = 6 if d.startswith("dcim") else 1
    found = None
    for base in range(0, 16):
        good = True
        for c in range(C):
            vals = [rows.get(base + step * n, [None] * C)[c] for n in range(N)]
            if None in vals or any(v != r for v, r in zip(vals, ref[:, c])):
                good = False; break
        if good:
            found = base; break
    print(f"{d:12s}", "bit-exact vs numpy, output at cycle", f"{found} + {step}n" if found is not None else "MISMATCH")
    ok &= found is not None
print("ALL OK" if ok else "MISMATCH")
