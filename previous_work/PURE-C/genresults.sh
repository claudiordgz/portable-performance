#!/bin/bash

sizes=(31 63 127 255 511 1023)

for s in "${sizes[@]}"
do
    echo $s
    make clean -s
    make SIZE=$s -s

    ./shallow_base | grep -A1 diagonal > results/out$s
done