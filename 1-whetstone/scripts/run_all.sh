#!/usr/bin/env sh

SCR_PATH=`dirname "$0"`

BIN_PATH=$SCR_PATH/../bin
RES_PATH=$SCR_PATH/../result

for ex in `find "$BIN_PATH" -executable -type f`; do
    $ex
done
