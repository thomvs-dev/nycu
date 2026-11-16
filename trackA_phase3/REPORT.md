# Track A, Phase 3: digital CIM vs ordinary digital logic for grant-free activity detection (1-bit weights, synthesis)

Date: 2026-11-17. Code and results: `D:\nycu\trackA_phase3\`.
Follows `TrackA_Phase2_step1_2a.md`, `Negative_result_binary_dictionaries.md` and the kill test `KillTest_DCIM_vs_WS_synthesis.md` (same flow).

Labels: [S] our synthesis and gate-level simulation; [P] arithmetic on those numbers.

## 1. Result

**KILL. Track A closes.**
- Question: for the same non-orthogonal AMP detector, is digital CIM ≥ 1.3× more energy-efficient than ordinary digital logic at the pessimistic corner?
- Against the strongest baseline (`and_tree_ni`), digital CIM gives **0.70–0.93×** across 2 libraries × 2 glitch bounds [S]. Ordinary logic wins in every case, even with CIM's most favourable input scheme (`dcim_bp`).
- Even with CIM's clock energy set to zero, the bound is 1.20–1.42×, and 1.20× at the pessimistic case [P].
- Deeper trees (256 rows, one full macro height) give 0.79–0.84× (zero delay) [S].
- Sign-magnitude inputs make CIM worse, not better: 0.46–0.53× [S].

## 2. What was built

All designs: 64-row reduction × 2 pilot columns. Weights are ±1 pilot entries stored as one bit, held at the ports (storage outside the compared logic, as in the kill test). Inputs are 6-bit two's-complement AMP residuals (−31…31).

| Design | Description |
|---|---|
| `sgn_tree` / `sgn_tree_ni` | Each row adds +x or −x (7-bit leaf), balanced adder tree, one pipeline stage after 3 levels, output register. `_ni` has no input registers |
| `and_tree_ni` | **Strongest baseline.** Uses Σ s·x = 2·Σ_{s=+1} x − Σ x. Each column only selects x or 0 (6-bit leaf). Σ x is computed once per input vector and shared by all 2048 pilot columns |
| `dcim` | Digital CIM column (Chih ISSCC 2021 style): per-row 6-bit shift register, input bit AND weight bit, popcount tree, shift-accumulate over 6 bit-planes (MSB plane negative). Computes the same Σ_{w=1} x as `and_tree_ni` |
| `dcim_bp` | As `dcim`, but bit-planes come straight from a bit-transposed buffer (no shift registers). Most favourable case for CIM |
| `dcim_sm_bp` | Sign-magnitude inputs: 5 magnitude planes plus a per-row sign, 2-bit signed popcount leaves |

The final 2·P − Σx shift-subtract is one operation per column per vector for both `and_tree_ni` and the CIM designs, so it is a common term and is excluded. Common terms only pull ratios toward 1.

**Flow** (unchanged from the kill test):
- RTL from `gen_rtl_1b.py`; Icarus check bit-exact against numpy.
- Yosys 0.33 + ABC at 2 ns; Nangate45 (typical, 1.1 V) and Sky130 HD (tt, 25 °C, 1.8 V).
- Gate-level power with the kill test's `gsim.py`, unchanged; zero-delay (no glitches) and unit-delay (upper glitch bound).
- **Toolchain check:** I re-ran the kill test's `ws_tree_ni` and got 339.58 fJ/MAC and 43,870 cells on Nangate45, identical to the November 11 result.

**Stimulus:** real AMP operands from `detectors.amp_scores` with the Phase 2 quantiser (`extract_trackA_traces.py`).
- K = 80 active of 2048, 0 dB, 20 dB near–far spread, M = 64 antennas, 20 iterations, same pilots (seed 12345) as Step 2a.
- 2560 input vectors per opportunity; 256 used per lane, spread over all iterations in issue order. Zero fraction 5%, mean |x| 6.3.
- 64 lanes = 4 row blocks of the 256-row [Sr; Si] mapping × 16 pilot-column pairs.
- Second operating point (K = 40, −5 dB) checked on Nangate45 zero-delay: same numbers to within 0.1%.

**Verification:** every synthesised netlist reproduced every output bit-exactly against numpy (32,768/32,768 zero-delay; 16,384/16,384 unit-delay).

## 3. Energy per MAC [S]

fJ/MAC, logic only.

| Design | N45 zero-delay | N45 unit-delay | S130 zero-delay | S130 unit-delay | Cells (N45) | Leakage at 500 MHz, N45 |
|---|---|---|---|---|---|---|
| sgn_tree | 176.8 | 373.1 | 667.2 | 1,096.7 | 7,345 | 3.5 |
| sgn_tree_ni | 128.1 | 330.0 | 474.2 | 904.4 | 6,321 | 2.9 |
| **and_tree_ni** | **81.0** | **173.2** | **299.8** | **484.8** | 4,778 | 2.1 |
| dcim | 384.6 | 462.5 | 1,618.0 | 1,788.0 | 1,763 | 7.0 |
| **dcim_bp** | **107.7** | **186.0** | **428.3** | **599.1** | 997 | 2.9 |
| dcim_sm_bp | 172.5 | 325.5 | 655.7 | 1,007.6 | 2,182 | 4.9 |

Ratio, baseline ÷ digital CIM (above 1 means CIM is better):

| Pairing | N45 zero | N45 unit | S130 zero | S130 unit |
|---|---|---|---|---|
| **Strongest baseline vs CIM bit-plane** (`and_tree_ni` / `dcim_bp`) | **0.75** | **0.93** | **0.70** | **0.81** |
| Strongest baseline vs CIM with shift registers (`and_tree_ni` / `dcim`) | 0.21 | 0.37 | 0.19 | 0.27 |
| Strongest baseline vs CIM sign-magnitude (`and_tree_ni` / `dcim_sm_bp`) | 0.47 | 0.53 | 0.46 | 0.48 |
| Naive baseline vs CIM bit-plane (`sgn_tree_ni` / `dcim_bp`) | 1.19 | 1.77 | 1.11 | 1.51 |
| With input registers on both (`sgn_tree` / `dcim`) | 0.46 | 0.81 | 0.41 | 0.61 |

Sensitivity, 256-row trees (zero delay): `and_tree_ni` 80.1 / 295.2 fJ, `dcim_bp` 95.0 / 373.9 fJ (N45 / S130); ratio **0.84 / 0.79** [S].

## 4. Why digital CIM does not win here

Nangate45, zero delay, breakdown in fJ/MAC:
- `and_tree_ni`: logic 67.0, clock 12.8.
- `dcim_bp`: logic 64.7, clock 41.1.

1. **With 1-bit weights the logic is a tie.** The baseline has no multipliers either: each leaf is "x or 0". CIM's AND gates save nothing. Running a 1-bit popcount tree six times costs about the same as running a 6-bit tree once.
2. **CIM pays the clock six times.** The accumulator and pipeline registers are clocked once per bit-plane, so CIM's clock energy per MAC is 3.2× the baseline's.
3. **Upper bound with free clocking.** If CIM's clock energy were zero, the ratio would be 1.22 / 1.20 / 1.42 / 1.27 (N45 zero, N45 unit, S130 zero, S130 unit) [P]. The pessimistic case is still below 1.3.
4. **Weights don't move in the baseline either.** Each pilot column serves 128 input vectors (64 antennas × 2 real passes) per AMP iteration. Loading a column group's 1-bit weights costs about 0.05–0.34 pJ/bit ÷ 128 ≈ 0.4–2.7 fJ/MAC [P], under 3% of the baseline's 81 fJ. CIM's structural advantage, reading weights in place, has almost nothing to save.
5. **The "shared sum" trick decides it.** Against a naive sign-select tree, CIM bit-plane reaches 1.11–1.77×. Any competent digital designer would use the 2P − Σx identity, and that removes the margin.

## 5. Limitations

- 45 nm and 130 nm standard cells, not 22/28 nm. Ratios agree within about 10% between the libraries at zero delay.
- Wire-load model, no place and route, X1 cells, no clock gating. Clock gating would help both sides; CIM's bound with free clocking is given above.
- The same custom-circuit loophole as the kill test: custom CIM adders may beat standard cells. Here the logic already ties, so CIM would need its custom circuits to be ≥ 1.3× cheaper than an equally custom digital tree, plus no clock overhead.
- Two's-complement inputs; sign-magnitude tested and worse for CIM.
- One tile width (2 columns); the shared Σx tree is outside the compared logic (amortised over 2048 columns).

## 6. Consequence for the project

- Track A (grant-free activity detection) closes at **NO-GO** on synthesis evidence: analog CIM loses to digital CIM (Phase 2), and digital CIM loses to ordinary digital logic (this test).
- It is the cleanest example yet for the criterion paper: high weight reuse (128 vectors per load) and 1-bit weights make the digital baseline as cheap as it can be.
- Not done: G6 (detection is a small share of base-station power) was not needed, since G4 fails first.

## Files

`D:\nycu\trackA_phase3\`: `extract_trackA_traces.py`, `gen_rtl_1b.py`, `rtl_check_1b.py`, `run_power_1b.py`, `summarize_1b.py`, `syn.sh`, `gsim.py` (copy, unchanged), `rtl/`, `results/` (power JSON per library and glitch model, `summary_1b.json`), `data/trackA_traces.npz`.
