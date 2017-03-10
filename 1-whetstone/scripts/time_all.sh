#!/bin/bash
ROOT=$(dirname $(readlink -f "$0"))
BIN=$(readlink -f "$ROOT/../bin/")
RES=$(readlink -f "$ROOT/../results/ex1")

trap ctrl_c INT

function ctrl_c() {
	pkill -P $$
}


files=$(ls $BIN)

LOOPS="100000 300000 500000"

OLDPATH=$PATH
PATH=$BIN:$PATH

cd $RES
for l in $LOOPS; do
    for exe in $files; do
	OUTFILE=$RES/$exe-$l.txt
	{ time -p "$exe" "$l" & } 2> $OUTFILE
    done
done

PATH=$OLDPATH
wait
