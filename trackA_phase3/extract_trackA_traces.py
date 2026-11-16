"""Record the 6-bit integer inputs that the Track A correlator receives inside AMP, plus the +/-1 pilot bits.
AMP and quantisation are the Phase 2 code (detectors.amp_scores, sram_cim_sim.quantize), floating-point
detector, x_bits = 6 (symmetric, -31..31), shared scale per call as in cim_ext.ComplexPilotCorrelator.
usage: python extract_trackA_traces.py SRC_DIR OUT.npz"""
import sys, numpy as np
sys.path.insert(0, sys.argv[1])
from detectors import make_pilots, make_slot, amp_scores
from sram_cim_sim import quantize

L, N, M, T = 128, 2048, 64, 20
S = make_pilots(L, N, np.random.default_rng(12345))             # same pilots as step2a
sr = (np.sign(S.real) > 0).astype(np.int8)                       # 1 -> +1, 0 -> -1
si = (np.sign(S.imag) > 0).astype(np.int8)
Wbits = np.vstack([sr, si])                                      # (256, 2048)
A = S / np.sqrt(L)
out = {"Wbits": Wbits}
for tag, (K, snr, sp) in {"k80_0dB": (80, 0, 20), "k40_m5dB": (40, -5, 20)}.items():
    rec = []
    def corr(R):
        top = np.vstack([R.real, R.imag]); bot = np.vstack([R.imag, -R.real])
        xm = np.max(np.abs(np.hstack([top, bot]))) + 1e-30
        qt, _ = quantize(top, 6, xm); qb, _ = quantize(bot, 6, xm)
        rec.append(np.hstack([qt, qb]).T.astype(np.int8))        # (2M, 256): top pass then bottom pass
        return A.conj().T @ R
    rng = np.random.default_rng(hash((K, snr, sp, 7)) % 2**32)
    Y, act, beta, s2 = make_slot(S, M, K, snr, sp, rng)
    amp_scores(Y, S, beta, s2, K / N, T=T, correlate=corr)
    X = np.concatenate(rec)                                      # (T*2M, 256) in issue order
    out["X_" + tag] = X
    nz = (X == 0).mean(); print(tag, X.shape, "zero frac %.2f" % nz, "mean|x| %.2f" % np.abs(X).mean(),
                               "p(|x|>=16) %.3f" % (np.abs(X) >= 16).mean())
np.savez_compressed(sys.argv[2], **out)
