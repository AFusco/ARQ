#!/bin/bash
ROOT=$(dirname $(readlink -f "$0"))
BIN=$(readlink -f "$ROOT/../bin/")
RES=$(readlink -f "$ROOT/../results/ex2")

trap ctrl_c INT

function ctrl_c() {
	pkill -P $$
}


files=$(ls $BIN)

LOOPS="100 500"

OLDPATH=$PATH
PATH=$BIN:$PATH

cd $RES
for l in $LOOPS; do
    for exe in $files; do
	OUTFILE=$RES/$exe-$l.txt
    m2s "$exe" 100
    done
done

PATH=$OLDPATH
wait
