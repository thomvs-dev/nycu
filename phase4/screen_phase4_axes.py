"""Phase 4 screen: new application spaces for SRAM / RRAM CIM, organised by the four axes
(energy, non-volatility, density, analog matrix computing).

Reuses the Phase 3 energy model (constants and e_base / e_dcim copied verbatim from
D:\\nycu\\phase3\\screen_phase3_niches.py, which writes its own JSON on import, so it is not imported).

Labels: [M] measured / stated in a cited source, [S] simulated or synthesised in this project,
[P] projected (arithmetic here), [A] assumed.  Ratios are baseline / CIM: > 1 means CIM is better.
Corners: PES = pessimistic for CIM (baseline-friendly values everywhere), OPT = optimistic for CIM.

Run: python3 screen_phase4_axes.py  -> writes screen_phase4_axes.json next to this file.
"""
import json, os

# ----------------------------------------------------------------- Phase 3 model (copied)
PE_REF = 94.0                                   # fJ per 7x6 MAC, 22 nm [S]
R_DCIM = {"PES": 0.74, "OPT": 1.18}             # DCIM / adder-tree energy ratio [S]
C = {"PES": 56.0, "OPT": 11.0}                  # fJ/MAC control + activation movement, both sides [P]
MEM = {"B1_sram_buffer": {"PES": 0.05, "OPT": 0.34},     # pJ/bit [A, Phase 3]
       "B2_tiny_local": {"PES": 0.02, "OPT": 0.05}}      # pJ/bit [A, Phase 3, unsourced to silicon]
CORNERS = ("PES", "OPT")


def pe(bw, bx):                                 # fJ, scaled by bit product
    return PE_REF * bw * bx / 42.0


def e_base_digital(bw, bx, e_mem_pj_bit, reuse, c):     # fJ/MAC, weight fetched once per `reuse` MACs
    return pe(bw, bx) + bw * e_mem_pj_bit * 1e3 / reuse + C[c]


def e_dcim(bw, bx, c):
    return pe(bw, bx) / R_DCIM[c] + C[c]


# ----------------------------------------------------------------- new inputs (Phase 4)
# RRAM CIM macro energy at 8b input x 8b weight:
#   21.6 TOPS/W, 22 nm 8 Mb ReRAM-CIM (JSSC 2023, DCFTS)  -> 92.6 fJ/MAC   [M]
#   15.6 TOPS/W, 8b-8b end of 194.4-15.6 TOPS/W (Nat. Electron. 2021)     -> 128 fJ/MAC  [M]
# System overhead on top of the macro (input buffers, accumulation, control not in C): 1.0-2.0x [A]
E_RRAM = {"PES": 128.0 * 2.0, "OPT": 92.6 * 1.0}          # fJ/MAC
E_WAKE_CIM_NJ = {"PES": 10.0, "OPT": 1.0}                  # bias / reference / ADC power-up per wake [A]
CIM_PERIPH_LEAK_PW_BIT = {"PES": 1.0, "OPT": 0.1}          # periphery leakage while on, per stored bit [A]
# eNVM used as plain memory (strongest axis-2 baseline):
#   0.23 pJ/b 22 nm 1 Mb wide-IO STT-MRAM (JSSC 2022) [M]; 0.9 pJ/b 28 nm FD-SOI [M]; 1.2 pJ/b 28 nm Samsung [M]
E_MRAM = {"PES": 0.23, "OPT": 1.2}                         # pJ/bit
# SRAM retention in sleep: 0.9 uA/Mb at 0.5 V on 22FDX ULL cell = 0.45 pW/bit [M]; 2 pW/bit standard [A]
P_RET = {"PES": 0.45, "OPT": 2.0}                          # pW/bit
P_LEAK_ACTIVE = {"PES": 1.0, "OPT": 10.0}                  # pW/bit active weight-store leakage [A, Phase 3]
E_SRAM_WRITE = MEM["B2_tiny_local"]                         # pJ/bit, copy MRAM -> SRAM at wake [A]
BW = BX = 8


# ================================================================= AXIS 2: non-volatility (per wake)
def wake(n_w, r_w, t_s, c):
    """One inference per wake. n_w weights (8 b), r_w MACs per weight per wake, t_s sleep interval.
    Returns energies in nJ for the three digital options and RRAM CIM."""
    bits, macs = n_w * BW, n_w * r_w
    dyn_sram = macs * e_base_digital(BW, BX, MEM["B2_tiny_local"][c], r_w, c) * 1e-6       # nJ
    opts = {
        "sram_retained": bits * P_RET[c] * t_s * 1e-3 + dyn_sram,                          # pW*s = pJ
        "mram_direct": macs * e_base_digital(BW, BX, E_MRAM[c], r_w, c) * 1e-6,
        "mram_copy_to_sram": bits * (E_MRAM[c] + E_SRAM_WRITE[c]) * 1e-3 + dyn_sram,
    }
    best = min(opts, key=opts.get)
    cim = macs * (E_RRAM[c] + C[c]) * 1e-6 + E_WAKE_CIM_NJ[c]
    return opts, best, cim


def axis2_sweep():
    rows = []
    for r_w in (1, 10, 100):
        for t in (0.01, 0.1, 1, 10, 100, 1000):
            row = dict(n_w=125_000, weight_Mb=1.0, R_w=r_w, T_s=t)
            for c in CORNERS:
                opts, best, cim = wake(125_000, r_w, t, c)
                row[c] = dict(baseline=best, base_nJ=round(opts[best], 2), cim_nJ=round(cim, 2),
                              ratio=round(opts[best] / cim, 2))
            rows.append(row)
    return rows


def axis2_host(name, n_w, r_w, t_s, e_host_uJ, note):
    row = dict(name=name, n_w=n_w, weight_Mb=round(n_w * BW / 1e6, 3), R_w=r_w, T_s=t_s,
               host_uJ_per_wake=e_host_uJ, note=note)
    for c in CORNERS:
        opts, best, cim = wake(n_w, r_w, t_s, c)
        b = opts[best]
        row[c] = dict(baseline=best, base_nJ=round(b, 2), cim_nJ=round(cim, 2), ratio=round(b / cim, 2))
    # G6: saving as a share of the whole per-wake energy; pessimistic uses the large host energy
    save_p = row["PES"]["base_nJ"] - row["PES"]["cim_nJ"]
    save_o = row["OPT"]["base_nJ"] - row["OPT"]["cim_nJ"]
    row["saving_share_pct"] = [round(100 * save_p / (row["PES"]["base_nJ"] + e_host_uJ[1] * 1e3), 3),
                               round(100 * save_o / (row["OPT"]["base_nJ"] + e_host_uJ[0] * 1e3), 3)]
    return row


def axis2_continuous(name, n_w, steps_s, host_uW, note):
    """Continuous low-rate recurrent inference (T -> 0): weights must stay readable all the time."""
    bits, rate = n_w * BW, n_w * steps_s
    row = dict(name=name, n_w=n_w, weight_Mb=round(bits / 1e6, 3), steps_per_s=steps_s,
               MMAC_s=round(rate / 1e6, 2), host_uW=host_uW, note=note)
    for c in CORNERS:
        sram = rate * e_base_digital(BW, BX, MEM["B2_tiny_local"][c], 1, c) * 1e-9 + bits * P_LEAK_ACTIVE[c] * 1e-6
        mram = rate * e_base_digital(BW, BX, E_MRAM[c], 1, c) * 1e-9
        # DCIM leaks like the SRAM baseline; its pessimistic corner is HIGH leakage (Phase 3 convention),
        # so the DCIM ratio uses its own leakage corner on both sides.
        lk = {"PES": 10.0, "OPT": 1.0}[c]
        sram_d = rate * e_base_digital(BW, BX, MEM["B2_tiny_local"][c], 1, c) * 1e-9 + bits * lk * 1e-6
        dcim = rate * e_dcim(BW, BX, c) * 1e-9 + bits * lk * 1e-6
        rram = rate * (E_RRAM[c] + C[c]) * 1e-9 + bits * CIM_PERIPH_LEAK_PW_BIT[c] * 1e-6
        best = min(sram, mram)
        row[c] = dict(sram_B2_uW=round(sram, 2), mram_direct_uW=round(mram, 2), dcim_uW=round(dcim, 2),
                      rram_cim_uW=round(rram, 2), ratio_rram_vs_best=round(best / rram, 2),
                      ratio_dcim_vs_sram=round(sram_d / dcim, 2))
    row["saving_share_pct"] = [
        round(100 * (min(row["PES"]["sram_B2_uW"], row["PES"]["mram_direct_uW"]) - row["PES"]["rram_cim_uW"]) / host_uW[1], 2),
        round(100 * (min(row["OPT"]["sram_B2_uW"], row["OPT"]["mram_direct_uW"]) - row["OPT"]["rram_cim_uW"]) / host_uW[0], 2)]
    return row


# ================================================================= AXIS 1: FrodoKEM with a static key
def frodo(name, n, q_bits, s_bits, mbar=8):
    """Server decapsulation re-encrypts: B'' = S' A + E'. A (n x n) fixed for a static key; S' (mbar x n)
    random per session. Each element of A is used mbar times -> R = mbar."""
    row = dict(name=name, n=n, A_Mb=round(n * n * q_bits / 1e6, 2), R=mbar, weight_bits=q_bits, act_bits=s_bits,
               MAC_per_op=mbar * n * n)
    for c in CORNERS:
        b = e_base_digital(q_bits, s_bits, MEM["B2_tiny_local"][c], mbar, c)
        d = e_dcim(q_bits, s_bits, c)
        row[c] = dict(base_fJ=round(b, 1), dcim_fJ=round(d, 1), ratio=round(b / d, 2))
    return row


# ================================================================= AXIS 4: analog solve with changing A
def axis4():
    e_mac16 = {c: pe(16, 16) + C[c] for c in CORNERS}       # fJ, digital 16x16 MAC
    rows = []
    for label, e_cell_pj in (("write-verify, EMBER 1 b/cell 0.40 nJ/bit [M]", (400.0, 400.0)),
                             ("write-verify, EMBER 2 b/cell 1.2 nJ/bit [M]", (1200.0, 1200.0)),
                             ("one-shot predictive programming, no verify [A]", (100.0, 10.0))):
        # digital LU/Cholesky ~ n^3/3 MACs per new matrix; RRAM rewrite = n^2 cells
        n_star = {c: 3 * e_cell_pj[i] * 1e3 / e_mac16[c] for i, c in enumerate(CORNERS)}
        rows.append(dict(programming=label, n_crossover=[round(n_star["PES"]), round(n_star["OPT"])]))
    life = []
    for f_hz in (1, 100, 1000):
        life.append(dict(update_rate_Hz=f_hz, lifetime_endurance_1e4_s=1e4 / f_hz, lifetime_endurance_1e6_h=round(1e6 / f_hz / 3600, 2)))
    return dict(crossover=rows, endurance_lifetime=life,
                note="If A is fixed, digital precomputes A^-1 (or a factorisation) once; each solve is then an "
                     "n^2 MVM, i.e. axis 1. Analog INV only helps when A changes per use, where it pays n^2 writes.")


# ================================================================= AXIS 3: batch-1 small-LM decode
def axis3():
    E_DRAM = {"PES": 3.0, "OPT": 6.0}            # pJ/bit LPDDR4/5 incl. I/O [A, not sourced in this search]
    DENS = {"PES": 2.0, "OPT": 8.0}               # Mb/mm^2 RRAM-CIM macro incl. periphery [A]
    rows = []
    for params, wb in ((125e6, 4), (500e6, 4), (1e9, 4)):
        bits = params * wb
        row = dict(params=params, weight_bits=wb, weight_Gb=round(bits / 1e9, 2))
        for c in CORNERS:
            dram = pe(wb, 8) + wb * E_DRAM[c] * 1e3 + C[c]
            mram = pe(wb, 8) + wb * E_MRAM[c] * 1e3 + C[c]
            cim = E_RRAM[c] + C[c]                 # 8b-weight macro energy used for 4b weights (conservative)
            row[c] = dict(ratio_vs_DRAM=round(dram / cim, 1), ratio_vs_dense_eNVM=round(mram / cim, 1),
                          rram_area_mm2=round(bits / 1e6 / DENS[c]))
        rows.append(row)
    return rows


out = dict(model=dict(PE_fJ_8x8=round(pe(8, 8), 1), C_fJ=C, r_dcim=R_DCIM, mem_pJ_bit=MEM, E_RRAM_fJ_MAC=E_RRAM,
                      E_MRAM_pJ_bit=E_MRAM, P_RET_pW_bit=P_RET, P_LEAK_ACTIVE_pW_bit=P_LEAK_ACTIVE,
                      E_WAKE_CIM_nJ=E_WAKE_CIM_NJ, CIM_PERIPH_LEAK_pW_bit=CIM_PERIPH_LEAK_PW_BIT))

out["axis2_sweep_1Mb"] = axis2_sweep()
out["axis2_hosts"] = [
    axis2_host("S1 vibration condition monitoring, FC autoencoder, 0.4 Mb", 50_000, 1, 10, (0.1, 3000.0),
               "host per wake: 0.1 uJ (custom 90.7 nW chip class) to 3 mJ (MEMS accelerometer + ADC + MCU) [A]"),
    axis2_host("S1 vibration condition monitoring, FC autoencoder, 8 Mb", 1_000_000, 1, 10, (0.1, 3000.0), "same host range"),
    axis2_host("S2 battery-free sensor tag, MLP, 0.08 Mb", 10_000, 1, 5, (1.0, 10.0),
               "host per wake: low-power sensor + backscatter 1-10 uJ [A]"),
    axis2_host("S2 battery-free sensor tag, MLP, 1 Mb", 125_000, 1, 5, (1.0, 10.0), "same host range"),
    axis2_host("S2 battery-free sensor tag, 1D-CNN R_w=20, 1 Mb", 125_000, 20, 5, (1.0, 10.0), "conv reuse 20"),
]
out["axis2_continuous"] = [
    axis2_continuous("S3 wearable ECG/PPG GRU, 1 Mb, 250 steps/s", 125_000, 250, (100.0, 1000.0),
                     "patch power 0.1-1 mW [A]"),
    axis2_continuous("S3 wearable GRU, 0.25 Mb, 50 steps/s", 31_250, 50, (100.0, 1000.0), "small model"),
]
out["axis1_frodokem_static_key"] = [frodo("FrodoKEM-640", 640, 15, 5), frodo("FrodoKEM-976", 976, 16, 5),
                                    frodo("FrodoKEM-1344", 1344, 16, 4)]
out["axis1_classic_mceliece"] = dict(
    note="Encapsulation syndrome = XOR of t columns of the public key (sparse error vector). "
         "mceliece348864: t=64, column height 768 b, key 2.09 Mb [M spec].",
    bits_read_digital=64 * 768, cells_in_dense_array=768 * 2720,
    dense_over_sparse=round(768 * 2720 / (64 * 768), 1))
out["axis4_analog_solver"] = axis4()
out["axis3_small_LM_decode"] = axis3()

path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "screen_phase4_axes.json")
json.dump(out, open(path, "w"), indent=1)

if __name__ == "__main__":
    print("Axis 2 sweep, 1 Mb, ratio PES / OPT (baseline chosen):")
    for r in out["axis2_sweep_1Mb"]:
        print(f'  R_w={r["R_w"]:>3} T={r["T_s"]:>7} s  {r["PES"]["ratio"]:>6} ({r["PES"]["baseline"]})'
              f'  {r["OPT"]["ratio"]:>6} ({r["OPT"]["baseline"]})')
    for r in out["axis2_hosts"]:
        print(r["name"], "| ratio", r["PES"]["ratio"], r["OPT"]["ratio"], "| saving share %", r["saving_share_pct"],
              "| base nJ", r["PES"]["base_nJ"], r["OPT"]["base_nJ"], "| cim nJ", r["PES"]["cim_nJ"], r["OPT"]["cim_nJ"])
    for r in out["axis2_continuous"]:
        print(r["name"], r["PES"], r["OPT"], "share %", r["saving_share_pct"])
    for r in out["axis1_frodokem_static_key"]:
        print(r["name"], r["A_Mb"], "Mb |", r["PES"], r["OPT"])
    print(out["axis1_classic_mceliece"])
    print(json.dumps(out["axis4_analog_solver"], indent=1))
    for r in out["axis3_small_LM_decode"]:
        print(r)
