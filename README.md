# Reproducing Results:

1. Download and compile tools:
    ```
    ./scripts/installTools.sh
    ```

2. Generate artificial data:
    ```
    ./scripts/generateData.sh
    ```

    This generates the following data
    - data/reference.fa: a reference genome
    - data/simulated/reads_l50_k0_n100k.fa: 100k reads, with 0 error and length 50
    - data/simulated/reads_l50_k1_n100k.fa: with 1 error
    - data/simulated/reads_l50_k2_n100k.fa: ....
    - data/simulated/reads_l50_k3_n100k.fa
    - data/simulated/reads_l50_k4_n100k.fa
    - data/simulated/reads_l50_k5_n100k.fa
    - data/simulated/reads_l50_k6_n100k.fa
    - data/simulated/reads_l150_k0_n100k.fa: of length 150
    - data/simulated/reads_l150_k1_n100k.fa
    - data/simulated/reads_l150_k2_n100k.fa
    - data/simulated/reads_l150_k3_n100k.fa
    - data/simulated/reads_l150_k4_n100k.fa
    - data/simulated/reads_l150_k5_n100k.fa
    - data/simulated/reads_l150_k6_n100k.fa

    If you don't want to run a smaller example with 3 million base pairs, run:
    ```
    ./scripts/generateData.sh 3m
    ```

3. Prepare columba
    1. Generate columba index
    ```
        ./scripts/prepareColumbaIndex.sh
    ```
    Prepares all columba required data in `data/columba_index`

    2. Generate search schemes
    ```
    ./scripts/generateSearchSchemes.sh
    ```
    Creates columba compatible search schemes in `data/search_schemes`

4. Run searches
    ```
    ./scripts/runAll.sh
    ```
    - This will produce results in `output/<date>`.
    - The folder `output/$(date)/alignments/` has the actual alignments.
    - The folder `output/$(date}/logs/` carries the output of `columba` of each run.

5. Extract run times from log
    ```
    ./scripts/printRuntimes.sh output/<date>
    ```
    This will print a nice table with the run times:
```
       \(\mathcal{S}_{bt, k}\) &          - &          - &          - &          - &          - &          -
         \(\mathcal{S}_{OSS}\) &      0.57s &      1.01s &          - &          - &          - &          -
     \(\mathcal{S}_{01*0, k}\) &      0.67s &      0.92s &          - &          - &          - &          -
 \(\mathcal{S}_{01*0-opt, k}\) &      0.65s &      0.89s &          - &          - &          - &          -
       \(\mathcal{S}_{ph, k}\) &      0.62s &      1.02s &          - &          - &          - &          -
   \(\mathcal{S}_{ph-opt, k}\) &      0.57s &      0.81s &          - &          - &          - &          -
       \(\mathcal{S}_{sf, k}\) &      0.60s &      0.81s &          - &          - &          - &          -
   \(\mathcal{S}_{H, k, k+1}\) &      0.57s &      1.69s &          - &          - &          - &          -
   \(\mathcal{S}_{H, k, k+2}\) &      0.66s &      0.89s &          - &          - &          - &          -
   \(\mathcal{S}_{H, k, k+3}\) &      0.77s &      1.39s &          - &          - &          - &          -
     \(\mathcal{S}_{kianfar}\) &      0.58s &      0.75s &          - &          - &          - &          -
   \(\mathcal{S}_{kuch, k+1}\) &      0.62s &      1.04s &          - &          - &          - &          -
   \(\mathcal{S}_{kuch, k+2}\) &      0.66s &      1.01s &          - &          - &          - &          -
        \(\mathcal{S}_{hato}\) &      0.60s &      0.79s &          - &          - &          - &          -
```
