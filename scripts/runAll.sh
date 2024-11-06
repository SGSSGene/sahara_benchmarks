#!/usr/bin/env bash

set -Eeuo pipefail

export BENCHMARK_NAME=${BENCHMARK_NAME:-$(date  '+%Y%m%d-%H%M%S')}
export OUTPUT_DIR=output/${BENCHMARK_NAME}
export LOG_DIR=$OUTPUT_DIR/logs
export ALIGNMENT_DIR=${OUTPUT_DIR}/alignments

mkdir -p ${LOG_DIR}
mkdir -p ${ALIGNMENT_DIR}
for e in 1 2 3 4 5 6; do
    for l in 50 150; do
        n=100
        if [ ${e} -ge 5 ] && [ ${l} -eq 50 ]; then
            n=1
        fi
        for ss in $(ls data/search_schemes); do
            echo "running l${l} k${e} ${ss} - ./run.sh ${e} ${l} ${ss} - see ${LOG_DIR}/l${l}_${ss}_k${e}_n${n}k.log"
            ./scripts/run.sh "${e}" "${l}" "${ss}" ${n}k > "${LOG_DIR}/l${l}_${ss}_k${e}_n${n}k.log"
        done
     done
done
