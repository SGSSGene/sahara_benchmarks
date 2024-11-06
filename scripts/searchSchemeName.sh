#!/usr/bin/env bash

set -Eeuo pipefail

declare -A order
order=([backtracking]="\(\mathcal{S}_{bt, k}\)"
      [optimum]="\(\mathcal{S}_{OSS}\)"
      [01*0]="\(\mathcal{S}_{01*0, k}\)"
      [01*0_opt]="\(\mathcal{S}_{01*0-opt, k}\)"
      [pigeon]="\(\mathcal{S}_{ph, k}\)"
      [pigeon_opt]="\(\mathcal{S}_{ph-opt, k}\)"
      [suffix]="\(\mathcal{S}_{sf, k}\)"
      [h2-k1]="\(\mathcal{S}_{H, k, k+1}\)"
      [h2-k2]="\(\mathcal{S}_{H, k, k+2}\)"
      [h2-k3]="\(\mathcal{S}_{H, k, k+3}\)"
      [kianfar]="\(\mathcal{S}_{kianfar}\)"
      [kucherov-k1]="\(\mathcal{S}_{kuch, k+1}\)"
      [kucherov-k2]="\(\mathcal{S}_{kuch, k+2}\)"
      [hato]="\(\mathcal{S}_{hato}\)"
)
echo "${order[$1]}"
