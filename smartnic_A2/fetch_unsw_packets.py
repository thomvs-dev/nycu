"""Download the header columns of the UNSW-NB15 packet-level data (Packet-Fields subset, rdpahalavan/UNSW-NB15 on
HuggingFace), without the large packet_hex / payload_hex columns.

Each Packet-Fields file is ONE Parquet row group (about 10 M packets, ~14 GB, almost all of it hex payload), so
row-group sampling does not work. Parquet stores each column separately, so reading only ~16 header columns
fetches a small fraction of the file.

Run on your own machine (the Claude session cannot reach huggingface.co):
    pip install pyarrow fsspec aiohttp requests pandas
    python fetch_unsw_packets.py --files 1 10 --outdir data
Writes data/unsw_hdr_file<N>.parquet per file and prints row counts, label counts and size.
If HTTP 401/403: accept the dataset terms on HuggingFace, create a read token, then
    PowerShell: $env:HF_TOKEN="hf_..."      bash: export HF_TOKEN=hf_...
"""
import argparse, os, sys, time
import aiohttp, fsspec, pyarrow.parquet as pq

BASE = "https://huggingface.co/datasets/rdpahalavan/UNSW-NB15/resolve/main/Packet-Fields/Packet_Fields_File_{}.parquet"
COLS = ["packet_id", "flow_id", "source_ip", "source_port", "destination_port", "protocol",
        "IP len", "IP ttl", "IP tos", "IP flags", "IP proto", "TCP flags", "TCP window", "TCP dataofs",
        "UDP len", "ICMP type", "attack_label"]


def fetch(n, outdir, tok):
    fs = fsspec.filesystem(
        "https", headers={"Authorization": f"Bearer {tok}"} if tok else {},
        client_kwargs={"timeout": aiohttp.ClientTimeout(total=None, sock_connect=60, sock_read=900)})
    url = BASE.format(n)
    with fs.open(url, "rb", cache_type="none") as f:
        pf = pq.ParquetFile(f)
        have = set(pf.schema_arrow.names)
        cols = [c for c in COLS if c in have]
        missing = [c for c in COLS if c not in have]
        if missing:
            print("  columns not in this file (skipped):", missing)
        t0 = time.time()
        tb = pf.read(columns=cols, use_threads=False)
    out = os.path.join(outdir, f"unsw_hdr_file{n}.parquet")
    pq.write_table(tb, out, compression="zstd")
    print(f"  {tb.num_rows:,} rows, {len(cols)} columns -> {out} "
          f"({os.path.getsize(out) / 2**20:.0f} MB, {time.time() - t0:.0f} s)")
    print(tb.column("attack_label").to_pandas().value_counts().to_string())


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--files", type=int, nargs="+", default=[1, 10])
    ap.add_argument("--outdir", default="data")
    a = ap.parse_args()
    os.makedirs(a.outdir, exist_ok=True)
    tok = os.environ.get("HF_TOKEN")
    for n in a.files:
        print(f"\n=== File {n}")
        for attempt in range(1, 4):
            try:
                fetch(n, a.outdir, tok)
                break
            except Exception as e:                      # network hiccups: retry the whole file
                print(f"  attempt {attempt} failed: {type(e).__name__}: {e}")
                if attempt == 3:
                    print("  giving up on this file")
                time.sleep(10)


if __name__ == "__main__":
    sys.exit(main())
