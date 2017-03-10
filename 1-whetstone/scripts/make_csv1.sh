#!/bin/bash
ROOT=$(dirname $(readlink -f "$0"))
BIN=$(readlink -f "$ROOT/../bin/")
RES=$(readlink -f "$ROOT/../results/ex1")

trap ctrl_c INT

function ctrl_c() {
	pkill -P $$
}

OLDPATH=$PATH
PATH=$BIN:$PATH

cd $RES
raw_files=$(ls | grep "txt")
echo "Static,Options,Cycles,Real,User,Sys"
for file in $raw_files; do
	txt=$(echo $file | cut -d. -f1)
	STATIC=$(echo $txt | grep static -c)
	OPT=$(echo $txt | cut -d- -f2)
	if [ $STATIC -eq 1 ]; then
		CYC=$(echo $txt | cut -d- -f4)
	else
		CYC=$(echo $txt | cut -d- -f3)
	fi

	REAL=$(cat $file | grep real | cut -d" " -f2)
	USER=$(cat $file | grep user | cut -d" " -f2)
	SYS=$(cat $file | grep sys | cut -d" " -f2)
	
	echo $STATIC,$OPT,$CYC,$REAL,$USER,$SYS
done

PATH=$OLDPATH
wait
