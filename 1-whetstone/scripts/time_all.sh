#!/bin/bash
DIR=$(dirname $(greadlink -f "$0"))
BIN=$(dirname $DIR/../bin/)
RES=$(dirname $DIR/../results/)

echo $DIR $BIN $RES



#cd $BIN
#files=$(ls)

#LOOPS="100000 300000 500000"

#cd $RES
#for l in $LOOPS; do
    #for exe in $files; do
        #$(/usr/bin/time -lp "$exe" $l)>"$exe-$l.txt"
    #done
#done
