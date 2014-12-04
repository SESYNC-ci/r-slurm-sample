#!/bin/bash
#
#SBATCH -n1

export OUTPUT_DIR=output-${SLURM_JOB_ID}
mkdir ${OUTPUT_DIR}
R CMD BATCH --vanilla r-test-file.R ${OUTPUT_DIR}/output.out