"""Zero-delay gate-level simulator + liberty power model for yosys JSON netlists.

64 independent stimulus lanes are packed into uint64 words (one bit per lane).
Energy per cycle:
  - output internal energy of the driving cell per rise/fall (liberty internal_power tables,
    averaged over related pins, looked up at slew S0 and the net's load),
  - 0.5 * C_net * V^2 per net transition (C_net = fanout pin caps + wire-load-model cap),
  - flop clock-pin internal energy every cycle (liberty, 'when'-conditioned), D-pin hidden power,
  - clock net: CK pin cap * V^2 per cycle * CLK_TREE (tree overhead factor),
  - leakage: sum of cell_leakage_power, reported separately (needs a clock frequency).
Glitches are not modelled (zero delay); see unit-delay option `glitch=True` (each comb level is one
delay step; toggles at every step are counted).
"""
import json, re, numpy as np
from liberty.parser import parse_liberty

S0 = 0.04          # ns, nominal input slew for table lookup
CLK_TREE = 2.0     # clock tree cap multiplier on flop CK pin cap


def _arr(g, name):
    try:
        return np.array([float(v) for v in g.get_array(name).reshape(-1)])
    except Exception:
        return None


class Lib:
    def __init__(self, path, templates_cache={}):
        txt = open(path).read()
        L = parse_liberty(txt)
        self.V = float(L["nom_voltage"])
        cu = str(L["capacitive_load_unit"]).lower()
        self.k = 1000.0 if "pf" in cu else 1.0      # convert lib cap/energy units to fF / fJ
        tm = {}
        for g in L.get_groups("power_lut_template"):
            tm[str(g.args[0]).strip('"')] = (_arr(g, "index_1"), _arr(g, "index_2"))
        self.tm = tm
        wl = str(L["default_wire_load"]).strip('"')
        self.wire = None
        for g in L.get_groups("wire_load"):
            if str(g.args[0]).strip('"') == wl:
                fl = {int(a.value[0]): float(a.value[1]) for a in g.attributes if a.name == "fanout_length"}
                self.wire = (float(g["capacitance"]) * self.k, float(g["slope"]), fl)
        self.L = L
        self.cells = {}

    def wire_cap(self, fo):
        if self.wire is None or fo == 0:
            return 0.0
        cap, slope, fl = self.wire
        if fo in fl:
            ln = fl[fo]
        else:
            m = max(fl); ln = fl[m] + slope * (fo - m)
        return cap * ln

    def _lookup(self, g, load):
        vals = g.get_array("values")
        vals = np.array(vals, float)
        tmpl = str(g.args[0]).strip('"') if g.args else "scalar"
        i1 = _arr(g, "index_1"); i2 = _arr(g, "index_2")
        if tmpl in self.tm:
            i1 = i1 if i1 is not None else self.tm[tmpl][0]
            i2 = i2 if i2 is not None else self.tm[tmpl][1]
        load = load / self.k
        vals = vals * self.k
        if vals.size == 1:
            return float(vals.reshape(-1)[0])
        if vals.ndim == 1 or vals.shape[0] == 1:
            v = vals.reshape(-1)
            return float(np.interp(S0, i1, v)) if i1 is not None and len(i1) == len(v) else float(v.mean())
        # 2D: slew x load
        row = np.array([np.interp(load, i2, vals[k]) for k in range(vals.shape[0])])
        return float(np.interp(S0, i1, row))

    def cell(self, name):
        if name in self.cells:
            return self.cells[name]
        g = [c for c in self.L.get_groups("cell") if str(c.args[0]).strip('"') == name][0]
        info = dict(leak=float(g["cell_leakage_power"]), pins={}, out={}, ff=None, ck=None, hidden={})
        ffs = g.get_groups("ff")
        if ffs:
            ff = ffs[0]
            info["ff"] = dict(iq=str(ff.args[0]).strip('"'), iqn=str(ff.args[1]).strip('"'),
                              d=str(ff["next_state"]).strip('"'), ck=str(ff["clocked_on"]).strip('"'))
        for p in g.get_groups("pin"):
            pn = str(p.args[0]).strip('"')
            dr = str(p["direction"]).strip('"')
            if dr == "input":
                info["pins"][pn] = float(p["capacitance"]) * self.k
                ips = p.get_groups("internal_power")
                if ips:
                    info["hidden"][pn] = ips
            elif dr == "output":
                fn = str(p["function"]).strip('"')
                info["out"][pn] = dict(fn=fn, ip=p.get_groups("internal_power"))
        self.cells[name] = info
        return info

    def out_energy(self, cname, pin, load):
        """(E_rise, E_fall) fJ for one output transition, averaged over related pins."""
        ips = self.cell(cname)["out"][pin]["ip"]
        er, ef = [], []
        for ip in ips:
            for g in ip.groups:
                v = self._lookup(g, load)
                (er if g.group_name == "rise_power" else ef).append(v)
        return (np.mean(er) if er else 0.0, np.mean(ef) if ef else 0.0)

    def ff_clock_energy(self, cname):
        """(E per cycle when D==Q, E per cycle when D!=Q) from CK-pin when-conditioned power."""
        info = self.cell(cname)
        ck = info["ff"]["ck"]
        same, diff = [], []
        for ip in info["hidden"].get(ck, []):
            try:
                w = str(ip["when"]).strip('"')
            except Exception:
                w = ""
            e = sum(self._lookup(g, 0.0) for g in ip.groups)
            d1 = "!D" not in w
            q1 = ("!Q" not in w)
            (same if d1 == q1 else diff).append(e)
        if not same and not diff:
            allg = [sum(self._lookup(g, 0.0) for g in ip.groups) for ip in info["hidden"].get(ck, [])]
            e = float(np.mean(allg)) if allg else 0.0
            return (e, e)
        if not same: same = diff
        if not diff: diff = same
        return (np.mean(same), np.mean(diff))

    def ff_d_hidden(self, cname):
        info = self.cell(cname)
        d = info["ff"]["d"]
        es = []
        for ip in info["hidden"].get(d, []):
            for g in ip.groups:
                es.append(self._lookup(g, 0.0))
        return max(np.mean(es), 0.0) if es else 0.0


def compile_fn(fn, pins):
    """liberty boolean -> python expression on dict-of-arrays 'a'."""
    s = fn
    for p in sorted(pins, key=len, reverse=True):
        s = re.sub(rf"\b{p}\b", f"a['{p}']", s)
    s = s.replace("!", "~").replace("+", "|").replace("*", "&")
    return eval("lambda a: " + s)


class Netlist:
    def __init__(self, jpath, lib, top):
        J = json.load(open(jpath))
        M = J["modules"][top]
        self.lib = lib
        self.ports = {n: p for n, p in M["ports"].items()}
        ids = set()
        def nid(b):
            if b in ("0", 0) or b == "0": return 0
            if b in ("1", 1) or b == "1": return 1
            if b == "x": return 0
            return int(b) + 2 if isinstance(b, int) else int(b) + 2
        self.nid = nid
        comb, flops = [], []
        nmax = 2
        for cn, c in M["cells"].items():
            t = c["type"]
            info = lib.cell(t)
            conn = {p: nid(v[0]) for p, v in c["connections"].items()}
            nmax = max([nmax] + list(conn.values()))
            if info["ff"]:
                flops.append((t, conn))
            else:
                comb.append((t, conn))
        for p in self.ports.values():
            for b in p["bits"]:
                nmax = max(nmax, nid(b))
        self.N = nmax + 1
        self.flops, self.comb = flops, comb
        # loads
        cap = np.zeros(self.N); fo = np.zeros(self.N, int)
        for t, conn in comb + flops:
            info = lib.cell(t)
            for p, n in conn.items():
                if p in info["pins"]:
                    cap[n] += info["pins"][p]; fo[n] += 1
        for n in range(self.N):
            cap[n] += lib.wire_cap(int(fo[n]))
        self.cap = cap
        # drivers / internal energy per net
        self.er = np.zeros(self.N); self.ef = np.zeros(self.N)
        self.leak = 0.0
        for t, conn in comb:
            info = lib.cell(t)
            self.leak += info["leak"]
            for op in info["out"]:
                n = conn[op]
                self.er[n], self.ef[n] = lib.out_energy(t, op, cap[n])
        self.ff_q, self.ff_qn, self.ff_d, self.ff_ck = [], [], [], []
        ck_same, ck_diff, dh, ckcap = [], [], [], []
        for t, conn in flops:
            info = lib.cell(t)
            self.leak += info["leak"]
            ff = info["ff"]
            q = [p for p, o in info["out"].items() if o["fn"] == ff["iq"]]
            qn = [p for p, o in info["out"].items() if o["fn"] == ff["iqn"]]
            self.ff_q.append(conn.get(q[0], -1) if q else -1)
            self.ff_qn.append(conn.get(qn[0], -1) if qn else -1)
            self.ff_d.append(conn[ff["d"]])
            for p in q + qn:
                if p in conn:
                    self.er[conn[p]], self.ef[conn[p]] = lib.out_energy(t, p, cap[conn[p]])
            s, d = lib.ff_clock_energy(t)
            ck_same.append(s); ck_diff.append(d); dh.append(lib.ff_d_hidden(t))
            ckcap.append(info["pins"][ff["ck"]])
        self.ff_q = np.array(self.ff_q); self.ff_qn = np.array(self.ff_qn); self.ff_d = np.array(self.ff_d)
        self.ck_same, self.ck_diff = np.array(ck_same), np.array(ck_diff)
        self.ff_dh, self.ckcap = np.array(dh), np.array(ckcap)
        self._levelize()

    def _levelize(self):
        drv = {}
        for i, (t, conn) in enumerate(self.comb):
            for op in self.lib.cell(t)["out"]:
                drv[conn[op]] = i
        lvl = [-1] * len(self.comb)
        import sys
        sys.setrecursionlimit(100000)
        def L(i):
            if lvl[i] >= 0: return lvl[i]
            t, conn = self.comb[i]
            info = self.lib.cell(t)
            m = 0
            for p in info["pins"]:
                n = conn.get(p)
                if n is not None and n in drv:
                    m = max(m, L(drv[n]) + 1)
            lvl[i] = m
            return m
        for i in range(len(self.comb)):
            L(i)
        groups = {}
        for i, (t, conn) in enumerate(self.comb):
            groups.setdefault((lvl[i], t), []).append(i)
        self.levels = []
        for (l, t), idx in sorted(groups.items()):
            info = self.lib.cell(t)
            ins = {p: np.array([self.comb[i][1].get(p, 0) for i in idx]) for p in info["pins"]}
            outs = {op: (compile_fn(o["fn"], list(info["pins"])),
                         np.array([self.comb[i][1].get(op, 0) for i in idx])) for op, o in info["out"].items()}
            self.levels.append((l, ins, outs))
        self.depth = max(lvl) + 1 if lvl else 0

    def bits(self, port):
        return [self.nid(b) for b in self.ports[port]["bits"]]


ONES = np.uint64(0xFFFFFFFFFFFFFFFF)


class Sim:
    def __init__(self, nl):
        self.nl = nl
        self.v = np.zeros(nl.N, np.uint64)
        self.v[1] = ONES
        self.reset_counts()

    def reset_counts(self):
        self.rise = np.zeros(self.nl.N, np.int64)
        self.fall = np.zeros(self.nl.N, np.int64)
        self.cycles = 0
        self.ff_tog = 0
        self.ff_same = 0

    def set(self, nets, words):
        self.v[nets] = words

    def eval_comb(self, count, glitch):
        v = self.v
        if not glitch:
            for l, ins, outs in self.nl.levels:
                a = {p: v[ix] for p, ix in ins.items()}
                for op, (f, ox) in outs.items():
                    v[ox] = f(a).astype(np.uint64)
            return
        # unit delay: every gate re-evaluates from the previous snapshot; count every transition
        for it in range(self.nl.depth + 2):
            snap = v.copy()
            changed = False
            for l, ins, outs in self.nl.levels:
                a = {p: snap[ix] for p, ix in ins.items()}
                for op, (f, ox) in outs.items():
                    new = f(a).astype(np.uint64)
                    old = snap[ox]
                    d = old ^ new
                    if d.any():
                        changed = True
                        if count:
                            np.add.at(self.rise, ox, np.bitwise_count(~old & new).astype(np.int64))
                            np.add.at(self.fall, ox, np.bitwise_count(old & ~new).astype(np.int64))
                        v[ox] = new
            if not changed:
                break

    def step(self, pi_nets, pi_words, count=True, glitch=False):
        """one clock cycle: posedge (flops capture D), then new primary inputs, then comb settle."""
        prev = self.v.copy()
        nl = self.nl
        d = self.v[nl.ff_d].copy()
        q_old = self.v[nl.ff_q].copy()
        if count:
            tog = np.bitwise_count(d ^ q_old).astype(np.int64)
            self.ff_tog += (tog * 1).sum() * 0 + 0
            self._ck_e = getattr(self, "_ck_e", 0.0) + float((nl.ck_diff * tog + nl.ck_same * (64 - tog)).sum())
        m = nl.ff_q >= 0
        self.v[nl.ff_q[m]] = d[m]
        m2 = nl.ff_qn >= 0
        self.v[nl.ff_qn[m2]] = ~d[m2]
        self.v[pi_nets] = pi_words
        self.v[0] = 0; self.v[1] = ONES
        self.eval_comb(count, glitch)
        if count:
            if not glitch:
                self.rise += np.bitwise_count(~prev & self.v).astype(np.int64)
                self.fall += np.bitwise_count(prev & ~self.v).astype(np.int64)
            else:
                # flop outputs and PIs (comb nets were counted level by level)
                for idx in (nl.ff_q[nl.ff_q >= 0], nl.ff_qn[nl.ff_qn >= 0], pi_nets):
                    self.rise[idx] += np.bitwise_count(~prev[idx] & self.v[idx]).astype(np.int64)
                    self.fall[idx] += np.bitwise_count(prev[idx] & ~self.v[idx]).astype(np.int64)
            self.cycles += 1

    def energy(self, lanes=64):
        """total energy (fJ) over counted cycles, summed over lanes, and breakdown."""
        nl, V = self.nl, self.nl.lib.V
        tr = self.rise + self.fall
        e_sw = float((0.5 * nl.cap * V * V * tr).sum())
        e_int = float((nl.er * self.rise + nl.ef * self.fall).sum())
        e_ck_int = getattr(self, "_ck_e", 0.0)
        e_ck_net = float(nl.ckcap.sum() * CLK_TREE * V * V) * self.cycles * lanes
        e_dh = float((nl.ff_dh * tr[nl.ff_d]).sum())
        tot = e_sw + e_int + e_ck_int + e_ck_net + e_dh
        return tot, dict(switching=e_sw, internal=e_int, clk_pin_internal=e_ck_int,
                         clk_net=e_ck_net, d_hidden=e_dh)


def pack(bitmat):
    """bitmat: (64, nbits) array of 0/1 -> (nbits,) uint64 words"""
    w = np.zeros(bitmat.shape[1], np.uint64)
    for l in range(bitmat.shape[0]):
        w |= (bitmat[l].astype(np.uint64) << np.uint64(l))
    return w


def unpack(words, signed_width=None):
    """(nbits,) uint64 -> (64, nbits) 0/1"""
    lanes = np.arange(64, dtype=np.uint64)
    return ((words[None, :] >> lanes[:, None]) & np.uint64(1)).astype(np.int64)
