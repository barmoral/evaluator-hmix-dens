#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=30:00:00
#SBATCH --partition=blanca-shirts
#SBATCH --qos=blanca-shirts
#SBATCH --account=blanca-shirts
#SBATCH --gres=gpu
#SBATCH --job-name=tip3pfb_1000
#SBATCH --output=slurm_codes/hmix_dens_1000.log

module purge
module avail
ml anaconda
conda activate evaluator-blanca

python hmix_dens_calc.py
echo "Hmix+Density test for OCCN(CCO)CCO in TIP3P-FB in 1000 total molecules system size"

scontrol show job job_id > hmixdens_test_1000.txt
sacct --format=jobid,jobname,cputime,elapsed