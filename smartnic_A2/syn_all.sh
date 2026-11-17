#!/bin/bash
# resumable: skips designs already synthesised. usage: syn_all.sh lib designs...
cd "$(dirname "$0")"
lib=$1; shift; L=lib/nangate45.lib; [ $lib = s130 ] && L=lib/sky130_hd_tt.lib
for d in "$@"; do [ -f syn/${d}_${lib}.json ] && continue
  echo "$(date +%T) $d $lib $(bash syn_abcfast.sh $d 64 2 $L $lib | tr '\n' ' ')"; done
