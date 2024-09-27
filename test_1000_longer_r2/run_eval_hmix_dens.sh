#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=60:00:00
#SBATCH --partition=blanca-shirts
#SBATCH --qos=blanca-shirts
#SBATCH --account=blanca-shirts
#SBATCH --gres=gpu
#SBATCH --job-name=500_longer_r2
#SBATCH --output=slurm_codes/500_longer_r2.%j.log

module purge
module avail
ml anaconda
conda activate evaluator-blanca

python setup-options.py
python hmix_dens_calc.py
echo "Hmix+Density test for OCCN(CCO)CCO in TIP3P-FB in 500 total molecules system size. Longer run. r2"

sacct --format=jobid,jobname,cputime,elapsed