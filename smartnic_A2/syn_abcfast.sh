#!/bin/bash
# usage: syn.sh design R C lib tag [booth]
d=$1; R=$2; C=$3; lib=$4; tag=$5; booth=$6
B=""; [ "$booth" = "booth" ] && B="booth;"
cat > syn/${d}_${tag}.ys <<EOT
read_verilog rtl/${d}_R${R}C${C}.v
hierarchy -top $d
synth -top $d -flatten
$B
opt -full
dfflibmap -liberty $lib
abc -fast -liberty $lib -D 2000
opt_clean
stat -liberty $lib
write_json syn/${d}_${tag}.json
write_verilog -noattr syn/${d}_${tag}.v
EOT
yosys -q -l syn/${d}_${tag}.log syn/${d}_${tag}.ys >/dev/null 2>&1
grep -E "Chip area|Number of cells" syn/${d}_${tag}.log | tail -2
