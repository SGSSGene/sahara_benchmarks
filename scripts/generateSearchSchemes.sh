#!/usr/bin/env bash

set -Eeuo pipefail

export PATH="$(pwd)/tools/sahara/build/src/sahara:${PATH}"

sahara search_scheme -a -k 10 --columba data/search_schemes
