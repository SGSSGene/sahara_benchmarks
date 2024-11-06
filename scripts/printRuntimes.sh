#!/usr/bin/env bash

set -Eeuo pipefail

OUTPUT_DIR=$1
l=${2:-50}
for ss in $(bash scripts/orderNames.sh); do
    printf "%30s" "$(scripts/searchSchemeName.sh ${ss})"
    for e in 1 2 3 4 5 6; do
        file=${OUTPUT_DIR}/logs/l${l}_${ss}_k${e}.log
        file_100k=${OUTPUT_DIR}/logs/l${l}_${ss}_k${e}_n100k.log
        file_1k=${OUTPUT_DIR}/logs/l${l}_${ss}_k${e}_n1k.log
        result="-"
        if [ -e ${file} ]; then
            result="$(echo "Total duration: -" | cat - ${file} | grep "Total duration:" | sed 's|Total duration:\s*||' | tail -n 1)"
        elif [ -e ${file_100k} ]; then
            result="$(echo "Total duration: -" | cat - ${file_100k} | grep "Total duration:" | sed 's|Total duration:\s*||' | tail -n 1)"
        elif [ -e ${file_1k} ]; then
            result="$(echo "Total duration: -" | cat - ${file_1k} | grep "Total duration:" | sed 's|Total duration:\s*||' | tail -n 1)"
            if [ "${result}" != "-" ]; then
                result=$(echo ${result} | rev | cut -c 2- | rev)
                result="$(echo "${result} * 100." | bc -l)s"
            fi
        fi

        printf " & %10s" $result
    done
    echo
done

