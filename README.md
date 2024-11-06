# Reproducing Results:

1. Download and compile tools:
`./scripts/installTools.sh`

2. Generate artificial data:
`./scripts/generateData.sh`
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
`./scripts/generateData.sh 3m`

3. Prepare columba
3.1.
`./scripts/prepareColumbaIndex.sh`

3.2. Generate search schemes
`./scripts/generateSearchSchemes.sh`

4. Run searches
`./scripts/runAll.sh`
This will produce results in `output/<date>`.
The folder `output/$(date)/alignments/` has the actual alignments.
The folder `output/$(date}/logs/` carries the output of `columba` of each run.

5. Extract run times from log
`./scripts/printRuntimes.sh `output/<date>`
This will print a nice table with the runtimes.
