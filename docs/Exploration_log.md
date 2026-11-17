# Exploration log: what was tried, what it was compared with, and how it came out

Started 2026-11-17. Maintained by Claude with Thomas: add an entry every time a new algorithm, method or workload is explored, and update the entry when its verdict changes.

## How to read and update this log

Each entry records:
- **Algorithm / method:** the workload and the algorithm used.
- **Implemented on:** SRAM or RRAM, analog or digital, and how it was evaluated (behavioural simulation, energy model, RTL and synthesis, literature screen).
- **Baseline:** what it was compared against.
- **Output:** the key numbers, labelled [measured] (silicon, from cited papers), [simulated] (our simulations or synthesis), [projected] (our energy arithmetic) or [assumed].
- **Better or worse:** CIM ÷ baseline energy ratio, or quality difference, as a range from the pessimistic to the optimistic corner. Above 1× means CIM is better.
- **Verdict** and the gate that decided it.
- **Doc:** the detailed report in this project.

Current gate thresholds:
- G4 (energy gain vs the strongest digital baseline, pessimistic corner): **≥ 1.3×** since 2026-11-16. It was ≥ 2× before; earlier verdicts below were made at 2× and are re-scored where it matters.
- G6 (motivation): the block must be a meaningful share of host power, or enable something that otherwise does not fit.
- Phase 2 (CIM in a processor) used ≥ 1.2× vs software and must beat a per-tile MAC unit.

RRAM: no RRAM simulation has been run in this project yet. The RRAM analog matrix computing work for massive MIMO is a separate literature review. Where RRAM was discussed (Phase 3), the conclusion was that its benefits are density and non-volatility, which do not fix the failures below.

---

## Summary table

| # | Date | Workload / algorithm | Implemented on | Baseline | CIM vs baseline | Verdict | Deciding reason |
|---|---|---|---|---|---|---|---|
| 1 | 2026-11 (Phase 1) | GNSS L1 C/A acquisition (correlation vs PRN code phases) | Analog SRAM-CIM, energy model | FFT parallel-code-phase search; digital correlator bank | 0.05–4.2× full search; 0.09–4.4× narrow window [projected] | NO-GO (was conditional) | FFT does 153× fewer ops; digital CIM beats analog for 1-bit weights (see #7) |
| 2 | 2026-11 (Phase 1) | Unsourced random access (coded compressed sensing / SPARC; MIMO URA) | Analog SRAM-CIM, screen | Fast-transform digital decoders | n/a | NO-GO | AWGN codebook needs 2.4×10⁵ macros; MIMO variant = Track A |
| 3 | 2026-11 (Phase 1) | MUSIC direction of arrival | Analog SRAM-CIM, screen | FFT spectrum (uniform arrays) | Gain capped at 1.36–2.5× even with a free kernel [projected] | NO-GO | Spectrum is only 26–60% of the work (Amdahl) |
| 4 | 2026-11 (Phase 1) | Beam training / codebook search (far- and near-field) | Analog SRAM-CIM, screen | FFT (far-field); two-stage DFT + polar refinement (near-field) | 45× more ops than digital (near-field) [projected] | NO-GO | Far-field is an FFT; near-field is Track B with an op penalty |
| 5 | 2026-11 (Phase 1) | CSI fingerprint localisation (nearest-neighbour search) | Analog SRAM-CIM, screen | Digital LSH search | n/a | NO-GO | Search is 17% of work; 2,500 macros raw; LSH cuts it 10–50× |
| 6 | 2026-11 (Phase 1) | 5G NR PRACH preamble detection | Analog SRAM-CIM, screen | FFT-based detector | 118× more ops [projected] | NO-GO | Op penalty; multi-bit complex weights |
| 7 | 2026-11-05 | **Track A:** grant-free activity detection with AMP (±1 pilot dictionary) | Analog SRAM-CIM, behavioural simulation of the array (XNOR cell, differential bitline, ADC, mismatch, noise) | Measured digital SRAM-CIM macros (PS-IMC, DIMCA1, TSMC 22 nm) | Quality: matched with a clipped 4-bit ADC [simulated]. Energy: digital ÷ analog 0.06–1.7× [projected from measured] | NO-GO | Digital CIM does ±1 × 4-bit at equal or lower energy; analog pays an ADC per bit-plane |
| 8 | 2026-11-10 | CNN neural OFDM receiver (4 residual blocks, 62k MAC/RE) | Analog SRAM-CIM, link-level + CIM behavioural simulation | Digital SRAM-CIM at 7 × 6 bit | Network: 2.2 dB better than practical LMMSE [simulated]. Energy: analog costs 1–100× more than digital CIM; best corner parity [projected] | NO-GO | Column sums use 0.4–3% of full scale; needs an 11–13-bit-equivalent noise floor |
| 9 | 2026-11-11 | Same receiver, MSB-digital / LSB-analog hybrid | Hybrid SRAM-CIM, behavioural simulation | Digital SRAM-CIM at 7 × 6 bit | Quality: matched at standard noise [simulated]. Energy: 0.61–1.78× robust point; 0.43–2.34× fragile best point [projected] | NO-GO (pessimistic below parity) | Digital MSB part caps the gain at 6/nd; ADC still about 11.5 bits |
| 10 | 2026-11 (Phase 1 DCIM) | Neural receiver on digital CIM vs NPU | Digital SRAM-CIM, energy model + literature | Weight-stationary systolic NPU | 0.67–3.9× corners; same-node evidence 1.1–1.6× [projected / measured] | NO-GO | High weight reuse (R ≥ 10³): the NPU moves almost no weights either |
| 11 | 2026-11 (Phase 1 DCIM) | UE CSI encoder (autoencoder) | Digital SRAM-CIM, energy model | NPU | 4–96× on the kernel [projected] | NO-GO | Encoder ≤ 0.16% of modem power (G6) |
| 12 | 2026-11 (Phase 1 DCIM) | gNB CSI decoder | Digital SRAM-CIM, energy model | NPU | Likely below 2× (batched) [projected] | NO-GO | Batching gives high reuse; 2–4% of power |
| 13 | 2026-11 | **Synthesis kill test:** DCIM column vs weight-stationary adder-tree array, 7-bit weights × 6-bit activations | Digital SRAM-CIM, RTL + Yosys synthesis (Nangate45, Sky130) + gate-level power on real traces | Weight-stationary adder-tree MAC array | **0.74–1.18×** [simulated] | Confirms NO-GO for high-reuse workloads | Bit-serial inputs repeat the adder-tree reduction per input bit |
| 14 | 2026-11-12 | **Phase 2:** 6G near-field XL-MIMO + ISAC uplink on a RISC-V many-core cluster (TeraPool-class, 12 nm), CIM banks in L1 | Digital SRAM-CIM, precision simulation + system energy model | A: software on the cores; C: per-tile MAC + radix-4 FFT unit | Quality: int16 CIM matches q16 software; beamforming lossless at 8 × 6, FFT at 12 × 12 [simulated]. Energy: B/A 1.7–6.2×; **B/C 0.42–0.96×** [projected] | NO-GO as a CIM result | Gain is an offload gain; a MAC unit does as well, and CIM loses 4–8× on the FFT |
| 15 | 2026-11-13 | **Phase 3 A:** DNN block in a Taurus-class switch at line rate | Digital SRAM-CIM, screen | Weights in registers beside each multiplier | Energy 0.80–1.17×; area 1.04–1.16× [projected] | NO-GO | One packet per cycle, so weights never move (G4); 2.8% of switch power (G6) |
| 16 | 2026-11-13 | **Phase 3 A2:** per-packet GRU intrusion detector on a SmartNIC (75–150 Mpps) | Digital SRAM-CIM, screen | NPU with banked local weight memory (B2) | 1.44–4.19× vs B2; 2.40–21.7× vs single SRAM buffer [projected] | NO-GO at 2× → CANDIDATE at 1.3× → **NO-GO after synthesis (#25)** | Synthesis replaced the unsourced B2 number; see #25 |
| 17 | 2026-11-13 | **Phase 3 B:** per-packet GRU intrusion detector at an IoT gateway | Digital SRAM-CIM, screen | NPU with banked weight memory | 1.44–4.19× dynamic [projected] | NO-GO | Under 0.07% of gateway power (G6) |
| 18 | 2026-11-14 | Hearing-aid speech enhancement (TinyLSTM, GRU/LSTM denoisers) | Digital SRAM-CIM, screen with leakage | NPU with banked weight memory | 1.44–4.19× dynamic; 1.07–3.31× with leakage [projected] | NO-GO | Already done in silicon (CICC 2026, HyIMC); fails 1.3× with leakage |
| 19 | 2026-11-14 | Neural speech codec decoder (LPCNet, FARGAN) | Digital SRAM-CIM, screen | NPU with banked weight memory | 1.43–4.17× compact mapping; 0.20–1.27× dense [projected] | NO-GO at 2×; weak maybe at 1.3× | Only compact mapping works; 0.06–7.8% of device power; FARGAN about 5× cheaper |
| 20 | 2026-11-17 (Phase 4) | Long-list screen, 29 workloads across 4 axes (FrodoKEM static key, Classic McEliece, edge small-LM decode, MPC / STAP / SLAM analog solve, others) | SRAM and RRAM CIM, energy model + literature | Strongest per axis: banked SRAM (B2), dense eNVM, LPDDR NPU, digital factorisation | FrodoKEM 0.92–1.92×; edge LM 39–233× vs LPDDR but 62–2000 mm² of RRAM; analog-solve write crossover n ≥ 1900 with verify [projected] | NO-GO (the 26 not short-listed) | R = 8 (Frodo); sparse input (McEliece); area and novelty (axis 3); fixed-matrix collapse + write energy / endurance (axis 4) |
| 21 | 2026-11-17 (Phase 4) | S1: duty-cycled vibration condition monitoring, FC autoencoder, 0.4–8 Mb, one inference per 10 s wake | RRAM CIM (analog, 8 b), energy model | Best of SRAM retained / MRAM read directly / MRAM copied to SRAM | 3.98–93× per wake; saving 0.003–98% of wake energy [projected] | NO-GO | G1 already done (JSSC 2025, 90.7 nW vibration chip with digital CIM); G6 0.003% with commercial sensing |
| 22 | 2026-11-17 (Phase 4) | S2: battery-free / backscatter sensor tag, MLP 0.08–1 Mb or 1D-CNN, wake every 5 s | RRAM CIM, energy model | Same as #21 | MLP 1.55–87×; CNN 0.92–6.1×; saving 2–54% (1 Mb MLP) [projected] | NO-GO | G6 2% at the pessimistic corner; no tag workload needing ≥ 1 Mb found; G1 partially done |
| 23 | 2026-11-17 (Phase 4) | S3: continuous wearable ECG/PPG GRU, 0.25–1 Mb, 50–250 steps/s | RRAM CIM and DCIM, energy model with leakage | Banked SRAM + leakage; MRAM read directly | RRAM 1.10–18×; DCIM 1.06–3.57× [projected] | NO-GO | G4 1.10–1.14× pessimistic (no non-volatility benefit when running continuously); G1 done (RRAM ECG CIM, TBCAS 2023) |
| 24 | 2026-11-17 | **Track A Phase 3:** grant-free activity detection, digital CIM vs ordinary digital logic, ±1 pilots (1 bit) × 6-bit AMP residuals | Digital SRAM-CIM, RTL + Yosys synthesis (Nangate45, Sky130) + gate-level power on real AMP traces (kill-test flow, toolchain re-verified) | Adder tree with shared-sum trick (Σs·x = 2·Σ_{s=+1}x − Σx), no input registers | **0.70–0.93×** vs strongest baseline; 1.11–1.77× vs naive sign-select tree; 0.79–0.84× at 256 rows; ≤ 1.20–1.42× even with free CIM clocking [simulated] | NO-GO (Track A closed) | With 1-bit weights the logic ties; CIM clocks its accumulator 6× per vector; weights barely move in the baseline (128 vectors per load) |
| 25 | 2026-11-17 | **SmartNIC A2 synthesis:** per-packet GRU (H64, I16), 8-bit × 8-bit, k = 1–64 cycles per packet | Digital SRAM-CIM (bit-plane), RTL + Yosys (`abc -fast`, calibrated) on Nangate45 and Sky130 + gate-level power on int8 traces of a GRU trained on synthetic flows | Adder-tree array with a k-entry standard-cell weight store per multiplier; strongest = batched (k packets of independent flows, weight held k cycles); Booth variant tested and weaker | Core at k = 4–8: 1.16–1.18× (N45, no glitches) to 2.15–2.37× (S130, glitch bound); system 1.11–1.13× pessimistic, 2.00–2.18× optimistic; weight store measured at 7–27 fJ/bit (45 nm), below the assumed B2; NIC saving 0.06–0.2% pessimistic [simulated] | NO-GO | G4 1.11× and G6 ≤ 0.2% at the pessimistic corner; G5 not run (packet-level datasets unreachable) |

Docs: #20–#23 → `phase4/Phase4_step1_four_axis_screen.md`; #24 → `trackA/TrackA_Phase3_1bit_DCIM_synthesis.md`; #25 → `smartnic/SmartNIC_A2_synthesis.md`.

---

## Patterns across entries

1. **High weight reuse → no CIM gain.** Receivers, decoders, beamforming, switch DNNs, grant-free detection (#8–10, #12–15, #24). The digital baseline already keeps weights still.
2. **Low reuse → CIM wins, but the block is too small to matter.** CSI encoder, IoT gateway, codec (#11, #17, #19).
3. **Structure or noise beats a dense analog array.** FFT-friendly dictionaries and analog noise floors (#1–9).
4. **Against banked local weight memory, every low-reuse workload gives the same 1.4–4.2×.** The B2 energy (0.02–0.05 pJ/bit) was unsourced. Synthesis (#25) measured a k-entry store at 7–27 fJ/bit at 45 nm (about 2–7 fJ/bit 22 nm-equivalent), so B2 was generous to CIM; the low-reuse gain from avoided weight movement is smaller than screened.
5. **RRAM reuse criterion (Phase 4).** Against SRAM retention and eNVM read as memory, RRAM CIM clears 1.3× (pessimistic) only with reuse per wake R_w ≤ 8, sleep interval T ≳ 0.04 s (1 Mb) and models ≳ 0.1 Mb; then 5.2–87× at R_w = 1. Running continuously, it falls to 1.10–1.14×. The workloads inside this region (KWS, intermittent / battery-free, vibration, ECG) already have nvCIM or CIM silicon (#21–23).
6. **Axes 3 and 4 fail structurally.** Edge LMs need 62–2000 mm² of RRAM-CIM and the space is crowded; analog solves with a fixed matrix reduce to an MVM, and with a changing matrix they pay n² writes and hit 10⁴–10⁶ endurance (#20).
7. **CIM's datapath edge depends on precision and activation statistics.** 7 × 6 with sparse ReLU activations: 0.74–1.18× vs the hardwired array (#13); 8 × 8 with dense signed GRU activations: 1.09–1.96× (#25); 1-bit weights: below 1 (#24). Glitch-free vs glitch-bound spreads are large; an SDF-timed simulation would narrow them.

## Open items

- #16/#25 (A2): quantised-accuracy check (G5) still not run; packet-level CIC-IDS2017 / UNSW-NB15 are on HuggingFace and UNB, unreachable from the session. Only matters if A2 is reopened.
- #25: glitch energy sits between the zero-delay and unit-delay bounds; an SDF-timed gate-level run would place it (affects the criterion paper's datapath claim, not the A2 verdict).
- Track B (near-field XL-MIMO channel estimation) has no closing doc; its kernel appears in #4 and #14.
- No RRAM simulation yet (Phase 4 used published RRAM-CIM macro energies only).
- Phase 4: the reuse assumed in the MRAM near-memory TOPS/W claims (46–160 TOPS/W, ISSCC 2023) is unknown; if those figures hold at R_w = 1, the RRAM boundary moves.
- Phase 4: LPDDR pJ/bit and RRAM-CIM area density are assumed, not sourced.

## Change history

- 2026-11-17: log created from all project docs up to Phase 3 Step 1b; G4 threshold recorded as 1.3×.
- 2026-11-17: Phase 4 four-axis screen added (#20–#23); doc `phase4/Phase4_step1_four_axis_screen.md`, script `D:\nycu\phase4\screen_phase4_axes.py`.
- 2026-11-17: Track A Phase 3 synthesis test added (#24); Track A closed. Code `D:\nycu\trackA_phase3\`.
- 2026-11-17: SmartNIC A2 synthesis added (#25); #16 updated to NO-GO; pattern 4 revised, pattern 7 added. Code `D:\nycu\smartnic_A2\`.
