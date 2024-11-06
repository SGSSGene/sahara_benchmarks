#!/usr/bin/env bash

set -Eeuo pipefail

export PATH="$(pwd)/tools/sahara/build/src/sahara:${PATH}"

sahara search_scheme -a --columba data/search_schemes
