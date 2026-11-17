# SmartNIC per-packet GRU (log #16): digital CIM vs a weight-store digital array, synthesis

Date: 2026-11-17. Code and results: `D:\nycu\smartnic_A2\` and `smartnic_A2/` in the GitHub repository.
Follows `Phase3_step1_screen.md` (candidate A2) and the kill test (same flow).

Labels: [S] our synthesis and gate-level simulation; [P] arithmetic on those numbers; [A] assumed.

## 1. Result

**NO-GO at the pessimistic corner.** This closes the last live application candidate.

| | Pessimistic | Optimistic |
|---|---|---|
| Core ratio at NIC rates (k = 4–8), strongest baseline ÷ digital CIM | 1.16–1.18 [S] | 2.15–2.37 [S] |
| System ratio, with Phase 3 common terms | **1.11–1.13** [P] | **2.00–2.18** [P] |
| NIC power saved (75–150 W host) | 0.06–0.2% [P] | 0.95–3.3% [P] |

- **G4 fails at the pessimistic corner** (1.11 < 1.3). The pessimistic corner is Nangate45 without glitches; the optimistic one is Sky130 at the unit-delay glitch upper bound. Real circuits sit between those two glitch bounds, and this test cannot say where.
- **G6 fails at the pessimistic corner:** the saving is at most 0.2% of NIC power.
- **The unsourced number behind the Phase 3 screen is now measured.** At NIC rates (k = 4–8), a k-entry standard-cell weight store costs 7–27 fJ per weight bit at 45 nm (batched: 7–9) and 29–75 fJ at 130 nm, without node scaling. Scaled to 22 nm with the kill test's ×0.26, the 45 nm figures are about 2–7 fJ/bit, **below** the assumed 20–50 fJ/bit (B2). So the Phase 3 estimate of 1.44–4.19× was generous to CIM. Very little of CIM's measured gain comes from avoiding weight movement.
- **Where the gain does come from is the datapath.** At 8-bit × 8-bit with dense, signed GRU activations, a bit-serial CIM column beats even the hardwired multiplier array (k = 1) by 1.09× glitch-free and 1.47–1.96× at the glitch upper bound. The 7 × 6 kill test, with sparse non-negative ReLU activations, gave 0.74–1.18× instead. The CIM datapath advantage depends on precision and activation statistics, which is a useful addition to the criterion paper.

## 2. What was built

Workload: per-packet GRU, input 16, hidden 64, 8-bit weights × 8-bit activations. Per packet: W_ih x (192 × 16) + W_hh h (192 × 64) = 15,360 MACs. The tile maps W_hh (64-row reduction), which is 80% of the MACs. At 500 MHz, k = cycles per packet is 3.4 at 148.8 Mpps and 6.7 at 75 Mpps.

All designs: 64-row × 2-column tile, weights held at ports (storage outside the compared logic; storage leakage and area are added analytically).

| Design | Description |
|---|---|
| `ws_k{1,4,8,16,64}` | Adder-tree array; each multiplier holds k weights in a k-entry standard-cell store (k:1 read select) and serves k output columns. k = 1 is the hardwired array |
| `ws_k*` batched | Same hardware, but k packets from independent flows are batched: each weight is held for k cycles while the input changes every cycle. Latency k / packet rate (27 ns at k = 4 and 148.8 Mpps; 107 ns at k = 8 and 75 Mpps). This is the strongest baseline at k > 1 |
| `wsb_k1` | Radix-4 Booth encoders shared per row, partial products fused into the column tree. Tested as a stronger multiplier; it came out **worse** (976 vs 873 fJ/MAC glitch-free, 4,533 vs 3,089 at the glitch bound), so the plain array multiplier is kept as the baseline |
| `dcim_g{1,2,8}` | Digital CIM column, bit-plane inputs (most favourable to CIM), 8 planes, MSB plane negative. G stored weights per cell position with a G:1 select; G = 1 for k ≤ 8 (with 8/k weight copies), G = 2 for k = 16, G = 8 for k = 64 |

**Flow:** as the kill test (Yosys 0.33, Nangate45 and Sky130, `gsim.py` unchanged), with one change. ABC with a 2 ns delay target did not finish within the session's time limits for 128 8-bit × 8-bit signed multipliers, so `abc -fast` is used for every design. Calibration: on the kill-test designs `abc -fast` moves both energies by +3.4% and leaves the ratio unchanged (0.737 vs 0.737).

**Stimulus:** a GRU trained (JAX) on **synthetic** per-packet flows [A], int8-quantised. Mean |w| = 26.9; hidden state mean |h| = 70 LSB, 21% saturated, 13% zero (first packet of each flow). Packets of different flows are interleaved, as on a NIC. Sensitivity: a Gaussian activation stream (σ = 40 LSB) gives core ratios 1.05 / 1.15 / 1.12 at k = 1 / 4 / 8, close to the trained GRU (1.09 / 1.18 / 1.16).

**Verification:** every netlist reproduced every output bit-exactly against numpy (65,536/65,536 baseline outputs, 8,192/8,192 CIM outputs per zero-delay run), with a unique output latency found by search.

## 3. Energy per MAC [S]

fJ/MAC, core logic only.

| Design | N45 zero | N45 unit | S130 zero | S130 unit |
|---|---|---|---|---|
| ws_k1 (hardwired) | 872.6 | 3,088.7 | 4,065.4 | 14,944.0 |
| ws_k4 / batched | 973.8 / **946.4** | 4,035.2 / **3,555.1** | 4,391.0 / **4,357.0** | 21,718.8 / **18,045.4** |
| ws_k8 / batched | 1,090.0 / **926.4** | 4,274.6 / **3,356.4** | 4,667.3 / **4,296.8** | 21,965.6 / **16,413.4** |
| ws_k16 / batched | 1,355.7 / **915.7** | 4,489.5 / **3,194.5** | 5,418.2 / **4,251.1** | 22,627.7 / **15,569.1** |
| ws_k64 / batched | 3,030.8 / **907.3** | — | — | — |
| **dcim_g1** | **799.0** | **2,106.0** | **3,114.0** | **7,619.4** |
| dcim_g2 | 828.2 | 2,015.8 | 3,277.2 | 8,284.0 |
| dcim_g8 | 1,046.4 | — | 3,944.7 | — |

Core ratio, strongest baseline ÷ CIM:

| k | N45 zero | N45 unit | S130 zero | S130 unit |
|---|---|---|---|---|
| 1 | 1.09 | 1.47 | 1.31 | 1.96 |
| **4** | **1.18** | 1.69 | 1.40 | 2.37 |
| **8** | **1.16** | 1.59 | 1.38 | 2.15 |
| 16 | 1.11 | 1.58 | 1.30 | 1.88 |
| 64 | 0.87 | — | — | — |

System ratio (adds the Phase 3 common terms as 0.39 / 0.08 of the hardwired core energy [P]): N45 zero 1.11–1.17; S130 zero 1.25–1.36; N45 unit 1.38–1.62; S130 unit 1.65–2.18.

## 4. Area at equal throughput (Nangate45) [S + A]

Logic from synthesis; storage at 2.66 µm² per latch (DLH_X1) for the baseline store and 0.5–1.5 µm² per CIM bitcell [A]; CIM pays 8/k copies for k < 8.

| k | Baseline µm² per MAC/cycle | CIM µm² per MAC/cycle | Baseline ÷ CIM |
|---|---|---|---|
| 1 | 628 | 585–649 | 0.97–1.07 |
| 4 | 748 | 585–649 | 1.15–1.28 |
| 8 | 891 | 585–649 | 1.37–1.52 |

CIM is smaller at NIC rates, but not decisively.

## 5. Gate table

| Gate | Result |
|---|---|
| G1 Novelty | OPEN (Phase 3 audit, medium confidence; ACM not searched) |
| G2 Fit | Pass: 0.12 Mb (H64), 0.45 Mb (H128), × 8/k copies |
| G3 Amdahl | ≈ 100% of model MACs; per-flow state read/write (1–6%) is common to both |
| G4 ≥ 1.3× pessimistic | **Fail: 1.11–1.13** (system); core 1.16–1.18 |
| G5 Quality | **Marginal** (Section 8): on UNSW-NB15 packet headers, int8 costs 1.44 points of 10-class macro-F1 (margin was ≤ 1 point) and 0.98 points of attack-vs-normal F1. The float model itself is weak (macro-F1 0.39, binary F1 0.77). 4-bit post-training quantisation collapses |
| G6 Motivation | **Fail at pessimistic:** 0.06–0.2% of NIC power (optimistic 0.95–3.3%) |
| **Verdict** | **NO-GO** (G4 and G6 at the pessimistic corner) |

## 6. What a reviewer will attack

1. **"The answer sits between your two glitch bounds."** True: 1.11× (no glitches) to 1.4–1.6× (N45 glitch bound). Only a timing-annotated (SDF) gate-level simulation would place it. Even at 1.6×, G6 stays below about 1–2% of NIC power.
2. **"Standard cells, 45/130 nm, wire-load model, no clock gating."** Same limitations as the kill test. A custom CIM macro may do better; a custom datapath may too.
3. **"The GRU was trained on synthetic data."** Re-run on operands from a GRU trained on UNSW-NB15 (Section 8): ratios 1.10 / 1.20 / 1.16 at k = 1 / 4 / 8 (Nangate45, no glitches), essentially unchanged.
4. **"Batching changes per-flow ordering."** Two packets of the same flow in one batch would need a stall; with many concurrent flows this is rare. Without batching the baseline is weaker (ratios 1.22 / 1.36 at k = 4 / 8, N45 zero), still below 1.3 at k = 4.
5. **"`abc -fast` instead of the kill-test script."** Calibrated: same ratio on the kill-test designs.
6. **"The detector is not competitive."** True: header-only features, no inter-arrival time (the subset has no timestamp), first 8 packets per flow. Macro-F1 0.39 would not survive a networking review.

## 7. Consequence for the project

- SmartNIC A2 was the last live application candidate. It closes at NO-GO, on synthesis evidence.
- Two findings feed the criterion paper:
  1. The weight-store cost that "banked local memory" baselines pay is small (about 2–7 fJ/bit at 22 nm-equivalent). So the low-reuse gain predicted from weight movement mostly disappears against a well-designed baseline.
  2. The remaining CIM gain is a datapath effect that depends on precision and activation statistics: 0.74–1.18× at 7 × 6 with sparse ReLU activations, 1.09–1.96× at 8 × 8 with dense signed activations (k = 1, across corners).
- Possible next step, only if wanted: SDF-annotated gate-level simulation of `ws_k4` and `dcim_g1` to place the glitch energy between the bounds. It would sharpen the criterion paper's datapath claim; it would not rescue A2 (G6).

## 8. Addendum (2026-11-17): accuracy on real data and energy on real operands

**Data.** UNSW-NB15 packet-level headers (rdpahalavan/UNSW-NB15, Packet-Fields files 1 and 10; 17 header columns fetched with `fetch_unsw_packets.py`, 58 + 57 MB). About 111,000 flows per file; 94–95% normal. Packets are in order within each flow; 0.06–0.08% of flows have mixed labels (flow label = majority). **No timestamp column**, so no inter-arrival-time feature.

**Setup.** Same GRU (input 16, hidden 64, first 8 packets per flow, 10-class head). Train on file 1 (90/10 train/validation, half-normal/half-attack batches, inverse-square-root class weights), test on file 10. Quantised inference uses integer matrix-vector products, which is exactly what both the digital CIM and the digital baseline compute (bit-exact), so G5 measures quantisation, not CIM. Script: `unsw_gru_accuracy.py`.

**Accuracy on file 10** (test flows: normal 105,293; exploits 2,216; fuzzers 1,276; reconnaissance 1,002; generic 348; dos 326; shellcode 129; backdoor 35; worms 17; analysis 4):

| Model | Macro-F1, 10 classes | Macro-F1, 7 classes (rare merged) | Attack-vs-normal F1 |
|---|---|---|---|
| Float, no TTL (main) | 0.392 | 0.509 | 0.774 |
| **int8 weights × int8 activations** | 0.378 (**−1.44 pt**) | 0.490 (−1.92 pt) | 0.764 (**−0.98 pt**) |
| 4-bit weights × int8 activations | 0.103 (−29 pt) | 0.147 | 0.148 |
| Float, with TTL (sensitivity) | 0.418 | 0.540 | 0.785 |
| int8, with TTL | 0.367 (−5.2 pt) | 0.469 | 0.747 |

Reading:
- **G5 is marginal.** int8 misses the ≤ 1-point margin on macro-F1 by about half a point and meets it on attack-vs-normal. This is plain post-training quantisation with one scale per matrix; per-row scales or quantisation-aware training would likely recover it (not tested).
- **4-bit needs quantisation-aware training.** Post-training 4-bit collapses.
- **The detector is weak in absolute terms.** Rare classes are near zero F1 (4–35 test flows each); the model sees headers only. A paper would need inter-arrival times (CIC-IDS2017 packet data may have them; not checked) and a stronger model, which also changes the MAC count.
- **TTL** (a known UNSW-NB15 artifact) helps float slightly and hurts int8 more, because it widens the input range under one shared input scale.

**Energy on real operands** (W_hh and hidden states of the UNSW-trained int8 GRU: mean |w| 12.1, mean |h| 47, 13% zero, 11.5% saturated; all outputs bit-exact):

| Design | N45 zero (fJ/MAC) | S130 zero (fJ/MAC) |
|---|---|---|
| ws_k1 (hardwired) | 832.6 | 3,884.6 |
| ws_k4 / batched | 952.6 / 907.1 | 4,296.6 / 4,184.4 |
| ws_k8 / batched | 1,063.9 / 879.8 | 4,550.7 / 4,088.9 |
| dcim_g1 | 756.0 | 2,965.9 |
| **Core ratio k = 1 / 4 / 8** | **1.10 / 1.20 / 1.16** | **1.31 / 1.41 / 1.38** |

System ratio at the pessimistic corner (N45 zero, heavy common terms): **1.11–1.14**. Unchanged from the synthetic-trace result, so the verdict stands: **NO-GO** (G4 and G6 at the pessimistic corner), with G5 marginal.
