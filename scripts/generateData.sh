#!/usr/bin/env bash

set -Eeuo pipefail

size=${1:-3gb}

mkdir -p data

export PATH="$(pwd)/tools/sahara/build/src/sahara:${PATH}"

# generate reference genome
sahara read_simulator \
    -o data/reference.fa \
    -n 1 \
    -l ${size}

# generate reads
mkdir -p data/simulated

## generate reads of length 50 and 100
for l in 50 150; do
    ## generate reads with 0-6 errors
    for e in 0 1 2 3 4 5 6; do
        sahara read_simulator \
            -i data/reference.fa \
            -n 100k \
            -l $l \
            --fasta_line_length 0 \
            -e $e \
            -o data/simulated/reads_l${l}_k${e}_n100k.fa
    done
done
