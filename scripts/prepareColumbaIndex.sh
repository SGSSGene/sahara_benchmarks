#!/usr/bin/env bash

set -Eeuo pipefail

export PATH="$(pwd)/tools/columba/build:$(pwd)/tools/sahara/build/src/sahara:${PATH}"

mkdir -p data/columba_index

sahara columba_prepare -i data/reference.fa -o data/columba_index/index
columba_build data/columba_index/index
