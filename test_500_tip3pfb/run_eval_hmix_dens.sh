#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=30:00:00
#SBATCH --partition=blanca-shirts
#SBATCH --qos=blanca-shirts
#SBATCH --account=blanca-shirts
#SBATCH --gres=gpu
#SBATCH --job-name=tip3pfb_500
#SBATCH --output=slurm_codes/hmix_dens_500.%j.log

module purge
module avail
ml anaconda
conda activate evaluator-blanca

python hmix_dens_calc.py
echo "Hmix+Density test for OCCN(CCO)CCO in TIP3P-FB in 500 total molecules system size"

sacct --format=jobid,jobname,cputime,elapsed