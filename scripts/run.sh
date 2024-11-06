#!/usr/bin/env bash

set -Eeuo pipefail

e=${1}
l=${2}
ss=${3}
n=${4}

export PATH="$(pwd)/tools/columba/build:${PATH}"
ALIGNMENT_DIR=${ALIGNMENT_DIR:-alignments}
mkdir -p ${ALIGNMENT_DIR}
echo columba -e ${e} -s 16 -p uniform -i 0 -o "${ALIGNMENT_DIR}/align_l${l}_k${e}_ss${ss}_n${n}.sam"  -ss custom data/search_schemes/${ss}/ data/columba_index/index data/simulated/reads_l${l}_k${e}_n${n}.fa

if [ ! -e data/search_schemes/${ss}/${e}/searches.txt ]; then
    echo "Total duration: -"
    exit
fi


timeout --foreground 3600 columba -e ${e} -s 16 -p uniform -i 0 -o "${ALIGNMENT_DIR}/align_l${l}_k${e}_ss${ss}_n${n}.sam"  -ss custom data/search_schemes/${ss}/ data/columba_index/index data/simulated/reads_l${l}_k${e}_n${n}.fa \
    || echo -e "\nTotal duration: -\n"

