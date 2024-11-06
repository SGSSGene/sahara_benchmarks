#!/usr/bin/env bash

set -Eeuo pipefail

mkdir -p tools
(if test ! -e tools/sparsehash; then
    git clone https://github.com/sparsehash/sparsehash.git $_
    cd $_
    ./configure; make
fi)

(if test ! -e tools/columba; then
    git clone https://github.com/biointec/columba.git -b v1.2 $_
    mkdir -p $_/build && cd $_
    cmake -DTHIRTY_TWO=OFF -DSPARSEHASH_INCLUDE_DIR=../../sparsehash/src -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-O3 -DNDEBUG -march=native" ..
    make
fi)

(if test ! -e tools/sahara; then
    git clone https://github.com/seqan/sahara.git -b v1.3.0 $_
    mkdir -p $_/build && cd $_
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
fi)
