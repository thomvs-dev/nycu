# Phase 4 Step 1: four-axis screen for new SRAM / RRAM CIM application spaces

Date: 2026-11-17. Status: screen only. No RTL was written.
Script: `D:\nycu\phase4\screen_phase4_axes.py`, output `screen_phase4_axes.json`.
Follows `Phase3_step1b_niches_screen.md` and the exploration log (entries 1–19).

Labels: [M] measured or stated in the cited source; [S] simulated or synthesised in this project; [P] projected (our arithmetic); [A] assumed. Ratios are baseline ÷ CIM, pessimistic–optimistic for CIM.

## 0. Answer

No new candidate passes. 29 workloads were screened across the four axes. Three passed the prefilter and were gated in full, and all three are **NO-GO**:

| # | Short-listed candidate | Axis | G4, pessimistic–optimistic | Deciding gate |
|---|---|---|---|---|
| S1 | Duty-cycled vibration condition monitoring | 2 (RRAM non-volatility) | 3.98–93× [P] | G1 ALREADY DONE (JSSC 2025, energy-harvester-powered vibration chip with digital CIM); G6 0.003% at the pessimistic host |
| S2 | Battery-free / backscatter sensor tag with on-tag inference | 2 | 1.55–87× for fully connected models, 0.92–6.1× for a CNN [P] | G6 2% at the pessimistic corner; G1 PARTIALLY DONE |
| S3 | Continuous wearable ECG/PPG recurrent model | 2 + 1 | RRAM 1.10–18×, DCIM 1.06–3.57× [P] | G4 below 1.3× at the pessimistic corner; G1 ALREADY DONE |

The per-packet SmartNIC GRU (log #16) remains the only live application candidate.

**The screen does produce one new, general result: the RRAM form of the reuse criterion.** Against the strongest digital baselines (SRAM kept in retention, MRAM read directly, or MRAM copied to SRAM at wake), RRAM CIM clears 1.3× at the pessimistic corner only when all three of these hold:
- **reuse per wake R_w ≤ 8** MACs per weight per power-on period;
- **sleep interval T ≳ 0.04 s** for a 1 Mb model; below that, SRAM retention is cheaper than any reload;
- **model ≳ 0.1 Mb**, so the CIM wake-up overhead is amortised.

Inside that region the gain is large: 5.2× pessimistic and 87× optimistic for a 1 Mb fully connected model. The reason is that eNVM bit reads cost 0.23–1.2 pJ/bit, 5–60× more than banked SRAM. Outside it, RRAM behaves like DCIM: 0.64–1.2× pessimistic. The workloads that sit inside the region (keyword and wake-up detection, intermittent and battery-free inference, vibration and ECG monitoring) are already published as nvCIM or CIM chips. So the region is real, but its applications are taken.

Axes 3 and 4 fail for structural reasons, not application by application (Section 3).

## 1. Model and inputs

The Phase 3 model is reused unchanged: PE 143 fJ at 8×8, r 0.74–1.18 [S], C 56–11 fJ [P], B2 0.02–0.05 pJ/bit [A]. Its constants are copied into the new script because the Phase 3 script writes its JSON on import.

New inputs:

| Item | Value | Label and source |
|---|---|---|
| RRAM-CIM macro, 8b × 8b | 92.6 fJ/MAC (21.6 TOPS/W, 22 nm, 8 Mb) to 128 fJ/MAC (15.6 TOPS/W at 8b-8b) | [M] JSSC 2023 DCFTS ReRAM-CIM; Nature Electronics 2021 nvCIM macro |
| RRAM system overhead beyond C | 1.0–2.0× of the macro energy; pessimistic CIM = 256 fJ/MAC | [A] |
| CIM wake-up (bias, references, ADC) | 1–10 nJ per wake | [A] |
| CIM periphery leakage while on | 0.1–1 pW per stored bit | [A] |
| MRAM read as plain memory | 0.23 pJ/bit (22 nm 1 Mb wide-IO macro) to 1.2 pJ/bit (28 nm, 128 Mb); 0.9 pJ/bit 28 nm FD-SOI | [M] JSSC 2022; VLSI 2020 Samsung/Arm; Grenoble 28 nm FD-SOI paper |
| SRAM retention | 0.45 pW/bit (22FDX ULL cell, 0.9 µA/Mb at 0.5 V) to 2 pW/bit | [M] / [A] |
| SRAM active leakage (continuous case) | 1–10 pW/bit | [A], Phase 3 |
| RRAM write-verify | 0.40 nJ/bit (1 b/cell), 1.2 nJ/bit (2 b/cell); array endurance 10⁴ | [M] EMBER macro |
| One-shot programming without verify | 10–100 pJ/cell | [A] |
| LPDDR energy | 3–6 pJ/bit | [A]; not sourced in this search |
| RRAM-CIM macro density incl. periphery | 2–8 Mb/mm² | [A] |

Paper numbers were read from abstracts and secondary pages. Check the tables by eye before citing.

### Axis-2 energy model (one inference per wake)

For n_w 8-bit weights, R_w MACs per weight per wake, and sleep interval T:
- Digital, SRAM retained: W·P_ret·T + MACs·(PE + 8·E_B2/R_w + C)
- Digital, MRAM read directly: MACs·(PE + 8·E_MRAM/R_w + C)
- Digital, MRAM copied to SRAM at wake: W·(E_MRAM + E_SRAM,write) + MACs·(PE + 8·E_B2/R_w + C)
- Baseline = the cheapest of the three. RRAM CIM = MACs·(E_RRAM + C) + E_wake.

## 2. The RRAM reuse criterion [P]

1 Mb model, ratio pessimistic / optimistic (the baseline chosen is shown in brackets):

| R_w | T = 0.01 s | 0.1 s | ≥ 1 s |
|---|---|---|---|
| 1 | 1.01 / 6.4 (SRAM retained) | 1.83 / 19.3 (retained) | **5.2 / 87** (MRAM direct) |
| 10 | 0.68 / 2.0 | 0.79 / 3.4 | 1.20 / 10.7 |
| 100 | 0.64 / 1.5 | 0.65 / 1.7 | 0.70 / 2.4 |

Pessimistic-corner thresholds for 1.3× (long T): R_w = 8 gives 1.33 and R_w = 9 gives 1.26. At R_w = 1, T must be at least 0.042 s. Model size at R_w = 1, T = 10 s: 10k weights give 1.55, 30k give 3.16 and 125k give 5.2. Wake-up overhead dominates small models.

Continuous operation (T → 0) removes the advantage: weights must stay readable, the best baseline is banked SRAM plus leakage, and RRAM gives 1.10–1.14× pessimistic (S3).

## 3. Long list (29 candidates)

R = MACs per weight load; k = clock ÷ step rate; R_w = MACs per weight per wake.

| # | Workload | Axis | Key property | Weights | Host, share | Closest prior art | Prefilter |
|---|---|---|---|---|---|---|---|
| 1 | FrodoKEM decapsulation with a static key (A held in CIM) | 1 | R = m̄ = 8; k ≫ 1; 15–16 b × 4–5 b | 6.1–28.9 Mb | PQ HSM / TLS offload | No CIM paper in Xplore; one near-memory MSc thesis (PoliTo) | **Fail G4**: 0.92–1.78 (640), 0.92–1.78 (976), 0.96–1.92 (1344) [P] |
| 2 | Classic McEliece encapsulation | 1 | Sparse input: t = 64 of 2720 columns | 2.09–8.4 Mb | Same | iMACE (ISVLSI 2019); ACIM-QMM (DAC 2025); memristive AMC for QC-MDPC McEliece (TC 2026) | **Fail**: a dense array computes 42× more cells than digital reads; taken |
| 3 | ML-KEM, ML-DSA, HQC, FHE polynomial products | 1 | NTT / cyclic structure | — | — | MeNTT (TVLSI 2022), RM-NTT (JXCDC 2022), CIM NTT (TCAS-II 2025) | **Fail**: structure beats dense; taken |
| 4 | Learned image codec, autoregressive context model decode | 1 | Serial, but wavefront decoding gives R ≈ W/3 ≈ 40; current codecs use checkerboard or channel-wise contexts | ~7 Mb | Camera / codec SoC | Not searched | **Fail**: R too high |
| 5 | Per-I/O learned model in an SSD controller (LinnOS-class) | 1 | k ≤ 1 | ~10⁴ weights [A] | SSD controller | Not searched | **Fail**: fits in registers beside the multipliers |
| 6 | NN controller for power converters or HDD servo, 0.1–1 MHz | 1 | k 100–1000 | 10⁴–10⁵ | kW converter | Not searched | **Fail G6**: controller energy negligible against the plant |
| 7 | Per-sample NN DPD; optical NN equaliser | 1 | k ≤ 1 | 10³–10⁴ | RF / optical front end | — | **Fail**: weights hardwired |
| 8 | Per-tick inference in low-latency trading | 1 | Batch 1, latency-bound | 0.1–1 Mb | FPGA | Not searched | **Fail G6**: power is not the metric; bit-serial CIM adds latency |
| 9 | UE-specific neural CSI decoders at a gNB (unbatchable) | 1 / 3 | R = 1 per report | 0.1–1 Gb total | gNB, 0.1–0.4% [P] | Two-sided CSI models are mostly shared in 3GPP studies | **Fail G6** and speculative |
| 10 | Per-event processing for event cameras | 1 | Event-driven | — | Vision sensor | Many SNN-CIM chips | **Fail G1** |
| 11 | Dense random projection / sketching at line rate | 1 | R = 1 | 1–10 Mb | NIC | — | **Fail**: structured fast JL transforms |
| 12 | Reservoir computing / ESN at the edge | 1 | R = 1, sparse reservoirs | 0.1–1 Mb | Wearable | Physical reservoir chip (ISCAS 2024) | **Fail**: sparse and taken |
| 13 | **Duty-cycled vibration condition monitoring** | 2 | R_w = 1 (FC autoencoder), T 1–60 s | 0.4–8 Mb | Harvested node | JSSC 2025 vibration CIM chip | **Pass** → S1 |
| 14 | **Battery-free / backscatter sensor tag** | 2 | R_w = 1 (MLP), T 1–10 s | 0.08–1 Mb | Tag, 1–10 µJ per wake [A] | JSSC 2026 battery-free platform; MOUSE; IPS-CiM; J-RFID 2025 | **Pass** → S2 |
| 15 | **Continuous wearable ECG/PPG GRU** | 2 + 1 | R = 1 per step, 50–250 steps/s | 0.25–1 Mb | Patch, 0.1–1 mW [A] | TBCAS 2023 RRAM ECG; BioCAS 2023; ISCAS 2025 LSTM DCIM | **Borderline pass** → S3 |
| 16 | Implantable cardiac rhythm discrimination | 2 | Continuous | 0.1–1 Mb | ~10 µW implant | 350 pW ventricular arrhythmia engine (JSSC 2026) | **Fail G1 / G5**: multilevel RRAM drift vs 10-year retention |
| 17 | Phone / watch always-on sensor hub | 2 | Retained SRAM | 8–32 Mb | Standby budget | Vega (MRAM cognitive wake-up); nvSRAM-CIM AI-IoT SoC (TCAS-II 2024) | **Fail G1** |
| 18 | CubeSat payload with eclipse power cycling | 2 | ~16 cycles/day | 10–100 Mb | W-class payload | — | **Fail**: reload ≈ 0.1–1 mJ per cycle [P], negligible |
| 19 | Automotive ECU key-on cold start | 2 | Rare cycles | 10–100 Mb | ECU | — | **Fail**: reload takes ms |
| 20 | Batch-1 small-LM decode at the edge (125 M–1 B params, 4 b) | 3 | R = 1 | 0.5–4 Gb | Phone | EdgeCIM (2026); CHIME, DATE 2026 (M3D RRAM) | **Fail G1 / G2**: 39–233× vs LPDDR and 3.4–47× vs dense eNVM, but 62–2000 mm² of RRAM-CIM [P] |
| 21 | On-device streaming ASR (RNN-T 30–100 M) | 3 | R = 1 per frame | 0.2–0.8 Gb | Earbud / phone | IBM PCM analog-AI speech chip (Nature 2023; not re-checked here) | **Fail G1** |
| 22 | Multi-tenant per-flow models on a SmartNIC exceeding SRAM | 3 | R ≈ 1 at µs latency | ~100 Mb | NIC | — | **Fail**: NICs are 5–7 nm without eRRAM, and 100 Mb SRAM fits there |
| 23 | On-device keyboard LM output layer | 3 | Keystroke rate | 8–100 Mb | Phone | — | **Fail G6** |
| 24 | On-robot VLA policies (0.5–7 B params) | 3 | Action tokens | 4–56 Gb | Robot | — | **Fail G2** |
| 25 | Linear / nonlinear MPC QP via RRAM analog solve | 4 | Fixed KKT → pre-factorise digitally (becomes axis 1); changing → writes | n 50–500 | Robot / drone | mAIC memristor iterative solver (2025–26); SRAM closed-loop IMC for Kalman and inverse kinematics (2026) | **Fail**: write crossover n ≥ 1900 with verify, 51–477 one-shot; 10⁴ endurance at 100 Hz lasts 100 s [P]; taken |
| 26 | SLAM back-end / factor graph | 4 | Sparse, changing | — | Robot | mAIC (2025–26) | **Fail**: taken; writes |
| 27 | Radar STAP covariance inversion per CPI | 4 | A changes 100–1000×/s | n 100–1000 | Radar | Not searched | **Fail**: endurance lifetime 10–100 s at 10⁴ [P] |
| 28 | Ising / QUBO annealing | 4 | Fixed J; each iteration is an MVM (axis 1) | — | — | Many CIM annealer chips (not enumerated here) | **Fail G1** |
| 29 | GNSS PVT least squares | 4 | 4×4 to tens | Tiny | Receiver | — | **Fail**: size and k |

Structural kills:
- **Axis 3.** The ratio is enormous, but the area is not available (62–2000 mm² of RRAM-CIM for 0.5–4 Gb), and the space is crowded. Against dense eNVM read as memory, the gain is the axis-2 mechanism again.
- **Axis 4.** If the matrix is fixed, the digital baseline factorises once and each solve becomes an MVM, which is axis 1. If it changes, write energy and endurance kill it. One-shot programming without verify narrows the energy gap but leaves endurance unchanged. The robotics and Kalman cases are published.

## 4. Short list: full gate tables

### S1: Duty-cycled vibration condition monitoring (axis 2)

FC autoencoder on spectral features, one inference per wake, T = 10 s.

| Case | Baseline chosen | Baseline nJ/wake | CIM nJ/wake | Ratio | Saving share of the wake |
|---|---|---|---|---|---|
| 0.4 Mb | MRAM direct | 102–488 | 25.6–6.2 | **3.98–78.9** | 0.003% (3 mJ host) – 82% (0.1 µJ host) |
| 8 Mb | MRAM direct | 2,039–9,754 | 322–105 | **6.33–93.3** | 0.057–97.9% |

Host energy per wake [A]: 0.1 µJ for a custom harvested chip (the JSSC 2025 chip runs the whole chain at 90.7 nW) up to 3 mJ for a MEMS accelerometer, ADC and MCU sampling at tens of kHz.

| Gate | Result |
|---|---|
| G1 Novelty | **ALREADY DONE**: Zhang, Yu, Yang et al., JSSC 2025: an energy-harvester-powered vibration condition-monitoring chip with a digital CIM DNN accelerator on ultra-low-power 13T SRAM, 90.7 nW. Also CIM for GIS acoustic-vibration monitoring (SGES 2026). |
| G2 Fit | Pass: 0.4–8 Mb is 1 macro of 8 Mb |
| G3 Amdahl | The NN is the only block touched; sensing and radio are not |
| G4 | Pass: 3.98× pessimistic |
| G5 | Not checked (analog RRAM accuracy on autoencoder reconstruction scores) |
| G6 | **Fail at the pessimistic corner**: 0.003% with commercial sensing. It passes only with a custom nW sensing chain, which is the prior-art chip |
| **Verdict** | **NO-GO** (G1, G6 pessimistic) |

What a reviewer will attack:
1. "The JSSC 2025 chip already reaches 90.7 nW with SRAM." A RRAM version is an increment on a measured chip.
2. "Sampling vibration at tens of kHz costs mJ." The NN does not matter at that host.

### S2: Battery-free / backscatter sensor tag (axis 2)

Backscatter communication is cheap, so the NN can be a large share of a wake. T = 5 s, host 1–10 µJ per wake [A].

| Case | Ratio | Saving share |
|---|---|---|
| MLP, 0.08 Mb | 1.55–47.9 | 0.07–8.7% |
| MLP, 1 Mb | **5.2–87.4** | **2.0–54%** |
| 1D-CNN, R_w = 20, 1 Mb | 0.92–6.1 | −0.6–51% |

| Gate | Result |
|---|---|
| G1 Novelty | **PARTIALLY DONE**: battery-free platform with event-driven computing, 94.8 nW (JSSC 2026); MOUSE, inference in NVM for energy harvesting (MICRO 2020); IPS-CiM (ICCD 2020); RRAM non-volatile processor for energy-harvesting IoE (VLSI 2017); memristor neuromorphic RFID circuits (IEEE J-RFID 2025); Viadotto (ACM TECS 2025, web search). Not found: RRAM CIM on a standard Gen2 RFID tag compared against an eNVM-read baseline |
| G2 Fit | Pass |
| G3 Amdahl | NN only |
| G4 | Pass for FC models ≥ 0.1 Mb (1.55–5.2× pessimistic); **fails** for CNNs (0.92×) |
| G5 | Not checked; multilevel RRAM drift over months is a concern for unattended tags |
| G6 | **Fail at the pessimistic corner**: 2% with a 10 µJ host. No tag application needing a ≥ 1 Mb low-reuse model was found |
| **Verdict** | **NO-GO** at the pessimistic corner. It would become CONDITIONAL only if a real tag workload needs a ≥ 1 Mb FC/RNN model with ≤ 1–2 µJ of other energy per wake |

What a reviewer will attack:
1. "No RFID tag runs a 1 Mb model." That is the open question, and I did not find a counterexample.
2. "E_wake of 1–10 nJ is assumed." For small models it decides the ratio (1.55× at 0.08 Mb).
3. "MRAM near-memory macros report 46–160 TOPS/W at 8 b (ISSCC 2023)." If that holds at R_w = 1, the MRAM baseline is much stronger than 0.23 pJ/bit. Not resolved in this search.

### S3: Continuous wearable ECG/PPG GRU (axis 2 + axis 1)

| Case | Best digital (µW) | RRAM CIM (µW) | RRAM ratio | DCIM ratio (Phase 3 leakage convention) | Saving share of 0.1–1 mW |
|---|---|---|---|---|---|
| 1 Mb, 250 steps/s | 12.2–27.3 (SRAM B2 + leakage) | 10.8–3.3 | **1.14–8.19** | 1.19–3.57 | 0.15–24% |
| 0.25 Mb, 50 steps/s | 0.81–3.37 | 0.74–0.19 | **1.10–18.0** | 1.06–2.44 | 0.01–3.2% |

| Gate | Result |
|---|---|
| G1 | **ALREADY DONE**: RRAM-CIM ECG classification (TBCAS 2023; BioCAS 2023 RRAM binary CNN); LSTM biomedical DCIM macro (ISCAS 2025); many ECG CIM processors |
| G4 | **Fail**: 1.10–1.14× pessimistic. In continuous mode the baseline keeps weights in banked SRAM, and RRAM loses its non-volatility advantage |
| G6 | 0.01–24% |
| **Verdict** | **NO-GO** (G4, G1) |

What a reviewer will attack: the RRAM energy uses a 2× system overhead at the pessimistic corner. At 1× overhead it would be about 1.8× (1 Mb case). That does not fix G1.

## 5. Novelty audit (G1)

**IEEE Xplore** (searched 2026-11-17 through the Xplore search service from the browser, the same back end as the web form; titles screened, abstracts read for the key hits). The CIM term set was ("compute-in-memory" OR "computing-in-memory" OR "in-memory computing" OR "processing-in-memory" OR "computation-in-memory").

| Query (CIM terms AND …) | Hits | Relevant |
|---|---|---|
| "predictive maintenance" OR "condition monitoring" OR "bearing fault" OR "machine health" OR "vibration" | 31 | JSSC 2025 90.7 nW vibration DCIM chip; SGES 2026 GIS acoustic-vibration CIM; PRISM (COINS 2025); JSSC 2026 battery-free platform |
| "RFID" OR "backscatter" OR "batteryless" OR "battery-free" OR "intermittent computing" OR "energy harvesting" | 50 | MOUSE; IPS-CiM; VLSI 2017 RRAM IoE processor; TCAS-II 2024 nvSRAM-CIM intermittent; J-RFID 2025 memristor RFID; JSSC 2026 battery-free |
| "ECG" OR "electrocardiogram" OR "arrhythmia" OR "PPG" OR "biosignal" | 62 | TBCAS 2023; BioCAS 2023 RRAM ECG; ISCAS 2025 LSTM DCIM; JSSC 2026 implantable VA engine; many others |
| ("wake-up" OR "power-off" OR "duty-cycled" OR "normally-off") AND (RRAM OR ReRAM OR MRAM OR nonvolatile) | 20 | ISSCC 2023 and JSSC 2024 non-volatile AI-edge processors (ReRAM); ISSCC 2023 MRAM near-memory macro; TCAS-II 2024 nvSRAM SoC |
| "FrodoKEM" OR "learning with errors" OR "McEliece" OR "LWE" | 11 | iMACE; ACIM-QMM; TC 2026 AMC McEliece; NTT PIM papers. **No FrodoKEM CIM paper** |

**Web searches** (about 20) covered MRAM / RRAM / DRAM energies, FrodoKEM hardware, intermittent ReRAM, edge-LLM CIM, analog matrix solvers for control, and RFID energy budgets. Hits used: EdgeCIM, CHIME, mAIC, Mannocci et al. 2026, NVMExplorer, Viadotto, the EMBER RRAM macro.

**Not searched**: ACM Digital Library and Scopus (no direct query; ACM papers appear only via web search). Novelty for long-list items killed on G4 or structure was not searched.

## 6. Where this leaves the project

After Phase 4, every workload that passes G4 at the pessimistic corner either has published CIM silicon or a block too small to matter. The one exception is the SmartNIC GRU (#16), which is still open. The four axes reduce to two mechanisms:

1. **Weight movement per MAC** (DCIM vs banked SRAM: 1.4–4.2×; RRAM vs eNVM read: 5–87× at R_w = 1).
2. **Where the weights live between uses** (retention vs reload), which sets the R_w and T boundaries above.

**Options**

1. **Extend the criterion paper with the RRAM boundary** (R_w ≤ 8, T ≳ 0.04 s, ≥ 0.1 Mb) next to the DCIM reuse boundary. Use published chips as positive evidence: battery-free, vibration, KWS and ECG nvCIM chips all sit inside the region; receivers, switches and continuous wearables sit outside.
   - Trade-off: no new hardware, defensible now, and it covers both SRAM and RRAM, which fits the professor's field. It is an analysis paper, and the MRAM near-memory baseline (46–160 TOPS/W claims) must be resolved first, because it could move the boundary.
2. **Finish the SmartNIC GRU checks** (quantised accuracy plus synthesis with banked memory and leakage, from the log's open items).
   - Trade-off: it is the only application with open novelty, but its ceiling is 1–6% of NIC power, and RRAM does not help at 5–7 nm NIC nodes.
3. **Do both.** Recommended. The synthesis test in option 2 gives the criterion paper its measured anchor for B2, which is the number most verdicts now hinge on.

Not done: G5 accuracy checks for S1–S3; full-text reads of the JSSC 2025 / 2026 chips (their energy breakdown would show how much of the 90.7 nW is weight storage); the R_w used in the MRAM-NMC TOPS/W figures; ACM and Scopus searches; a sourced LPDDR pJ/bit.

No GO or CONDITIONAL result, so there is no simulation or synthesis plan to approve. Waiting for your decision.

## Sources
- RRAM-CIM energy: [8-Mb ReRAM CIM, JSSC (IEEE Xplore 9874915)](https://ieeexplore.ieee.org/document/9874915); [nvCIM macro, Nature Electronics 2021](https://www.nature.com/articles/s41928-021-00676-9); [4MB SLC-MLC ReRAM CIM processor, ISSCC 2023 (dblp)](https://dblp.org/rec/conf/isscc/HuangWHKLJHCCLLTHCCC23.html)
- MRAM read energy: [22 nm 1 Mb wide-IO STT-MRAM, JSSC 2022](https://www.researchgate.net/publication/354942701_A_22-nm_1-Mb_1024-b_Read_Data-Protected_STT-MRAM_Macro_With_Near-Memory_Shift-and-Rotate_Functionality_and_426-GBs_Read_Bandwidth_for_Security-Aware_Mobile_Device); [28 nm FD-SOI STT-MRAM](https://hal-lirmm.ccsd.cnrs.fr/lirmm-02079679/document); [eNVM industry review (Samsung 28 nm 1.2 pJ/bit)](https://pmc.ncbi.nlm.nih.gov/articles/PMC11618178/); [22 nm 8 Mb MRAM NMC macro, ISSCC 2023](https://aminer.org/pub/642702aa90e50fcafd5ddf7b/a-nm-mb-stt-mram-near-memory-computing-macro-with-b-precision)
- SRAM retention: [22FDX ULL SRAM, 0.9 µA/Mb](https://www.bohrium.com/scholar/27620531/Youmean_Lee)
- RRAM write: [EMBER multi-bit RRAM](https://par.nsf.gov/servlets/purl/10586514)
- FrodoKEM hardware: [Deshpande, Longa, Szefer, ePrint 2025/2269](https://eprint.iacr.org/2025/2269); [ePrint 2025/1312](https://eprint.iacr.org/2025/1312); [PoliTo NMC thesis](https://webthesis.biblio.polito.it/26852/1/tesi.pdf)
- Edge LLM CIM: [EdgeCIM](https://www.emergentmind.com/papers/2604.11512); [CHIME, DATE 2026](https://past.date-conference.com/proceedings-archive/2026/DATA/1400.pdf)
- Analog solvers: [mAIC](https://www.researchsquare.com/article/rs-10393526/latest); [Mannocci et al. 2026](https://re.public.polimi.it/handle/11311/1303931); [BlockAMC](https://www.arxiv.org/pdf/2401.10042)
- Intermittent / battery-free: [ResiRCA](https://par.nsf.gov/servlets/purl/10193309); [Viadotto, ACM TECS 2025](https://imec-publications.be/bitstreams/d647c609-d6f6-4f7f-b851-f19a1cc1a2ff/download); [NVMExplorer](https://arxiv.org/pdf/2109.01188); [Vega SoC](https://arxiv.org/pdf/2110.09101)
- ECG RRAM CIM: [Diware et al., TBCAS 2023](https://research.tudelft.nl/en/publications/84bd18e2-e9c1-4d83-8ba8-dfdf92ca6f3a)
- Vibration CIM chip: Zhang et al., JSSC 2025, doi 10.1109/JSSC.2024.3413891; battery-free platform, JSSC 2026, doi 10.1109/JSSC.2026.3656981
