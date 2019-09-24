#!/bin/bash -l
# NOTE the -l flag!
#    see https://stackoverflow.com/questions/20499596/bash-shebang-option-l

#-----------------------
# Job info
#-----------------------

#SBATCH --job-name=run_estimator
#SBATCH --mail-user=mjagerton@ucdavis.edu
#SBATCH --mail-type=ALL

##SBATCH --output out-%j.output
##SBATCH --error out-%j.output

#-----------------------
# Resource allocation
#-----------------------

#SBATCH --time=100:00:00     # in d-hh:mm:ss
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --partition=high2
#SBATCH --mem=256000      # max out RAM

#-----------------------
# script
#-----------------------

hostname
module load julia/1.2.0

# create directory for the month
MON=$(date +"%Y-%m")
[ -d $MON ] &&  echo "Directory ${MON} exists" || mkdir $MON

# switch into directory
mkdir ${MON}/${SLURM_JOB_ID}
cd    ${MON}/${SLURM_JOB_ID}

echo "Starting job!!! ${SLURM_JOB_ID} on partition ${SLURM_JOB_PARTITION}"

# print out versions of repos
echo "ShaleDrillingModel          commit " $(git -C ~/dev-pkgs/ShaleDrillingModel/          rev-parse HEAD)
echo "ShaleDrillingData           commit " $(git -C ~/dev-pkgs/ShaleDrillingData/           rev-parse HEAD)
echo "ShaleDrillingEstimation     commit " $(git -C ~/dev-pkgs/ShaleDrillingEstimation/     rev-parse HEAD)
echo "ShaleDrillingPostEstimation commit " $(git -C ~/dev-pkgs/ShaleDrillingPostEstimation/ rev-parse HEAD)

# print out environment variables
julia -e 'println("\n"); [println((k,ENV[k],)) for k in keys(ENV) if occursin("SLURM_NTASKS",k)]; println("\n");'

# run the script
julia --optimize=3 ~/.julia/dev/ShaleDrillingEstimation/example/run_estimator.jl
