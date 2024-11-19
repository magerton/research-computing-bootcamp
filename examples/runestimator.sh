#!/bin/bash -l
# NOTE the -l flag!
#    see https://stackoverflow.com/questions/20499596/bash-shebang-option-l

#-----------------------
# Job info
#-----------------------

#SBATCH --job-name=Estimation
#SBATCH --mail-user=mjagerton@ucdavis.edu
#SBATCH --mail-type=ALL

#-----------------------
# Resource allocation
#-----------------------

#SBATCH --time=2-00:00:00     # in d-hh:mm:ss
#SBATCH --partition=high2
#SBATCH --mem=192000
#SBATCH --nodes=2
#SBATCH --account=magertongrp
#SBATCH --ntasks-per-node=64

# https://researchcomputing.princeton.edu/support/knowledge-base/julia

#-----------------------
# script
#-----------------------

echo ""
hostname
module load julia

# -------------------------------
# create directory for the year-month 
# to save data/results to
# (note, SLURM output saved to the directory from which the job was submitted)
# commented out for now
# -------------------------------

# echo ""
# MON=$(date +"%Y-%m")
# [ -d $MON ] &&  echo "Directory ${MON} exists" || mkdir $MON
# switch into directory
# mkdir ${MON}/${SLURM_JOB_ID}
# cd    ${MON}/${SLURM_JOB_ID}
# pwd

# -------------------------------
# some info
# -------------------------------

# directory where package is
SDRM_DIR=~/dev-pkgs/ShaleDrillingRevisedModel
# SDRM_DIR=~/temp-repos/ShaleDrillingRevisedModel

echo ""
echo "Starting job!!! ${SLURM_JOB_ID} on partition ${SLURM_JOB_PARTITION}"
echo "Script being used is in ${SDRM_DIR}"
echo ""
# print out versions of repos
echo "ShaleDrillingRevisedModel.jl commit " $(git -C ${SDRM_DIR}               rev-parse HEAD)
echo "ShaleDrillingResults         commit " $(git -C ~/ShaleDrillingResults/   rev-parse HEAD)
echo ""

# print out environment variables
printenv | grep SLURM

# -------------------------------
# julia!!
# -------------------------------

# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Full, TaxRoyShareScale - BASELINE - nonlinear" 
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""
# 
# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=full \
#     --simulate \
#     --scale=TaxRoyShareScale \
#     --startval='[0x1.6df564b915747p+0, -0x1.ca1a8ebea99e7p-1, 0x1.201e869e48224p-1, 0x1.a808daeda4fa6p-2, -0x1.fd322f10b8344p-6, 0x1.2e55bad1a1f57p-1, 0x1.465e24c6d6cp-1, 0x1.6d0c2b6127367p-1, 0x1.17c09beb403c6p-1, 0x1.618156d3d5ae4p-1, 0x1.7c53771827c14p-1, 0x1.98b657084272p-1, 0x1.ebe13008d425p-1, 0x1.044a2d1c008efp+0, 0x1.0c1df8fcbb5ebp+0, 0x1.17345d94f6545p+0, 0x1.1322753b96f1dp+0, 0x1.60bb1149961cdp+2, -0x1.40e0f9d3c5c14p+1, 0x1.cbe3849ba5997p+0, 0x1.7ec3190bb818dp+1, -0x1.36b6d1658036ap+1, -0x1.1962419fcf95ep+1, -0x1.290357d040755p+1, -0x1.13206ea2eb6fcp+1, 0x1.f5ab3c5c145dfp+0, 0x1.35e71be34b1d1p-3, 0x1.b9c4b84b96114p-2, -0x1.02e6bb3b89301p+1, -0x1.485f149da0cf4p+0, -0x1.c109a5c23fb3fp+4, 0x1.bab7924325ee3p+0, 0x1.6ad02c3752e21p+0, 0x1.1d18a8447e0dp+0, 0x1.b24fb643ed713p-2, 0x1.28272532d7aa4p-2, ]'
#     # --posterior \
#     # --simulate \
# 
# 
# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID}"


# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="MLE" 
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=mle \
#     --est \
#     --scale=TaxRoyShareScale \
#     --save_royprod

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID}"


# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="SML" 
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=SML \
#     --est \
#     --scale=TaxRoyShareScale \
#     --startval=' [1.6, 0.16626638346981415, 5.880495665899331, -2.422920766979676, 1.5377543967684708, 2.697918652100436, -2.416041233707867, -2.9540296489106543, -3.089052069368848, -2.782959129939335, 2.0200889424543216]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID}"

# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Payoff - Scrap" 
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=full \
#     --est \
#     --scrap \
#     --simulate \
#     --onlybaseline \
#     --posterior \
#     --scale=TaxRoyShareScale \
#     --startval='[0x1.2144f4ff2d7f4p+0, -0x1.695e00aa40b34p-1, 0x1.d244fc233285dp-2, 0x1.bd2cbedaa2483p-2, -0x1.8b3945af35eafp-6, 0x1.380d8c3686064p-1, 0x1.51876d5662226p-1, 0x1.6f84fd5fd6f8bp-1, 0x1.26845c80f82bap-1, 0x1.74b85b9ca3611p-1, 0x1.8a47042a22a51p-1, 0x1.affdfffa28548p-1, 0x1.ebb934d8185fcp-1, 0x1.0101fea8cd5afp+0, 0x1.088807f38de01p+0, 0x1.118e734285979p+0, 0x1.14a3cdbdd709dp+0, 0x1.2fe6642e91d74p+2, -0x1.35bb703a7afa9p+1, 0x1.1ecb9cf417257p+1, 0x1.503cfce700b9bp+1, -0x1.44f70ada5d597p+1, -0x1.6b9ec351df131p+0, -0x1.8c3e6491c3c5p+0, -0x1.771819dcdfdeap+0, 0x1.0a6658c6cf341p+1, 0x1.b00564f237434p+1, 0x1.04023946299cfp-2, 0x1.af7413623cf82p-2, -0x1.fc2143f5ea961p+0, -0x1.4d24170180d2ep+0, -0x1.ba8b8360ec9edp+4, 0x1.be6baf30bc204p+0, 0x1.6e985e6af3be7p+0, 0x1.201e5aa49f7c4p+0, 0x1.7ec4c65bd6285p-3, 0x1.2a3251a3821d7p-2, ]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"

# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Scale - NoAnticipTaxRoy"
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=full \
#     --simulate \
#     --est \
#     --onlybaseline \
#     --posterior \
#     --scale=NoAnticipTaxRoy \
#     --startval='[0x1.6df55291d9805p+0, -0x1.ca1a9c3de8db9p-1, 0x1.201e83b4ba9e3p-1, 0x1.a808db5fc4f4fp-2, -0x1.fd31ef1c09509p-6, 0x1.2e55bb1af46aap-1, 0x1.465e25b47a4a8p-1, 0x1.6d0c2a3d66cf3p-1, 0x1.17c09bda2a3cp-1, 0x1.618155f900085p-1, 0x1.7c537539115cp-1, 0x1.98b6541d0166fp-1, 0x1.ebe12d02def23p-1, 0x1.044a2c40ed0acp+0, 0x1.0c1df86d3e65ap+0, 0x1.17345d1fe3573p+0, 0x1.1322748ead5efp+0, 0x1.60bb14a9d353ep+2, -0x1.40e0f9a3e4e2p+1, 0x1.cbe37f408b382p+0, 0x1.7ec317d1dd8e2p+1, -0x1.36b6d166085b3p+1, -0x1.196245016a54cp+1, -0x1.29035b7925debp+1, -0x1.1320737aeff82p+1, 0x1.f5ab3b3fca9f1p+0, 0x1.35e72c9e0da67p-3, 0x1.b9c4b6b1e32bap-2, -0x1.02e6ba87bc036p+1, -0x1.485f15b0d46dfp+0, -0x1.c109a4c112eb5p+4, 0x1.bab7926dc862bp+0, 0x1.6ad02c49c3b3ep+0, 0x1.1d18a83cb883ep+0, 0x1.b24fab63437cfp-2, 0x1.282724a069131p-2, ]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"


# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Lease - All extend"
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=full \
#     --est \
#     --simulate \
#     --onlybaseline \
#     --lease=all_ext \
#     --scale=TaxRoyShareScale \
#     --startval='[0x1.6df562701295dp+0, -0x1.ca1a8f9e00e3dp-1, 0x1.201e8620e65dep-1, 0x1.a808db1792611p-2, -0x1.fd321a53a41b1p-6, 0x1.2e55b8afb52e8p-1, 0x1.465e22ab52acfp-1, 0x1.6d0c29078046p-1, 0x1.17c098a294891p-1, 0x1.6181542099d1ap-1, 0x1.7c53747da8e5bp-1, 0x1.98b654450772dp-1, 0x1.ebe12da3c56acp-1, 0x1.044a2bdc7fbb2p+0, 0x1.0c1df7cacb928p+0, 0x1.17345c687efa9p+0, 0x1.13227403ec1b4p+0, 0x1.60bb12686630fp+2, -0x1.40e0f9bbd1baap+1, 0x1.cbe3835b2b09fp+0, 0x1.7ec318e3e6a2ap+1, -0x1.36b6d111f3cf4p+1, -0x1.1962436d1040cp+1, -0x1.290359a9b0474p+1, -0x1.132070b646ce5p+1, 0x1.f5ab3c2f23c66p+0, 0x1.35e71e2bd97f4p-3, 0x1.b9c4b8478387dp-2, -0x1.02e6bb5d2043cp+1, -0x1.485f1485ed9fdp+0, -0x1.c109a5f3cff6p+4, 0x1.bab7925063fa3p+0, 0x1.6ad02c479733dp+0, 0x1.1d18a844e558ep+0, 0x1.b24fb91d67b61p-2, 0x1.2827251de2082p-2, ]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"



# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Sample - Exploratory"
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=full \
#     --sample=exploratory \
#     --est \
#     --simulate \
#     --onlybaseline \
#     --scale=TaxRoyShareScale \
#     --startval='[0x1.ca5a492a59693p+0, -0x1.fff94431317ecp-4, 0x1.54b02fc4c23fcp-1, 0x1.dcc4dec35f265p-2, 0x1.3a3805bb8d439p-2, 0x1.22e94d4ce0734p-1, 0x1.12b226fda04afp-1, 0x1.60ca3887b2422p-1, 0x1.b109f648c94acp-2, 0x1.fe237a69ccea7p-3, 0x1.20e157f05e733p-2, 0x1.25beffe257934p-2, 0x1.22d8771c8ce72p-1, 0x1.4666dd03e8986p-1, 0x1.7c6fc6227ce4ap-1, 0x1.9d06a62861a77p-1, 0x1.a5d8550e949bfp-1, 0x1.88f72aada4a29p-2, -0x1.af423fa4b392cp+0, 0x1.92e1c6d9639a3p+2, -0x1.25e097e56d4e2p+1, -0x1.f0ee9fea3e609p-1, -0x1.854c1655e5941p+0, -0x1.05dfd4b273cd9p+0, 0x1.6dedfba307bep-1, 0x1.5798eab721e8ap-3, 0x1.b2b571f227459p-2, -0x1.fd582414ba2a2p+0, -0x1.397c08ab78f73p+0, -0x1.b9cd9facb273dp+4, 0x1.bae6d1efc20bfp+0, 0x1.6b702a91496b8p+0, 0x1.1d83250c7d7e2p+0, 0x1.5a1bcb1793cefp-1, 0x1.250b03de02e6ap-2, ]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"



# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Leases - No expire"
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=full \
#     --noexpire \
#     --est \
#     --simulate \
#     --onlybaseline \
#     --scale=TaxRoyShareScale \
#     --startval='[-0x1.1b3ee11ac63bep-2, 0x1.3d2006f53128dp-1, 0x1.c5ba63c6cc622p-2, 0x1.0e0aae121d153p-1, -0x1.679d9bca6e02bp-7, 0x1.849d6f11010e3p-2, 0x1.c217b85bc68cbp-2, 0x1.e35e865793c3p-2, 0x1.0d8b1d2e01744p-1, 0x1.04c6c8609bf37p-1, 0x1.14e165f4a61p-1, 0x1.373930fc7c402p-1, 0x1.56d2f38322c2ep-1, 0x1.63e02ff65d01p-1, 0x1.71988a3013c32p-1, 0x1.7ccb1a8133ee8p-1, 0x1.8047b15422d39p-1, 0x1.4dbc8c3a39p+2, -0x1.42ac3518ba57ep+1, 0x1.99ecd106b2907p+1, 0x1.c624ec668c252p+0, -0x1.99d95ae4ea4e3p+1, 0x1.79f255f7664eep-2, 0x1.341e07d9b47ccp-2, 0x1.de5507794521p-3, 0x1.08aba1ab25432p+0, -0x1.c1bac88f74416p-3, 0x1.c67f958169866p-2, -0x1.0c0995b7c2e73p+1, -0x1.4bf4115fb2125p+0, -0x1.cf6f8304b435bp+4, 0x1.bd3d36aa7d6a4p+0, 0x1.6cdbe6d5d5c7cp+0, 0x1.1ef2d11bc4094p+0, 0x1.03873a7fdcb9ap-1, 0x1.36f1dbab87ac2p-2, ]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"


# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Payoff - DrillingCostFixed"
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=full \
#     --fixedcosts \
#     --est \
#     --simulate \
#     --onlybaseline \
#     --scale=TaxRoyShareScale \
#     --startval='[0x1.5277b869fe555p+0, -0x1.7bb65ac3d58e8p-1, 0x1.31d86c2423114p-1, 0x1.00c0d57b19caap-1, 0x1.7c97dd7fd7ef8p-3, 0x1.31d8057136bd5p-1, 0x1.53a1de942457ep-1, 0x1.2cc7360afaba6p-1, 0x1.bce7d9d64a55p-2, 0x1.27dcba33e5634p-1, 0x1.3cddffa4f7ae1p-1, 0x1.53fbeba6d0f66p-1, 0x1.9990037f7bb2dp-1, 0x1.a62bab334fa08p-1, 0x1.b2c321c802f18p-1, 0x1.c165f79634b6bp-1, 0x1.b3e1b55c072ebp-1, 0x1.f2afd2d8743ccp+0, 0x1.02bcf507311fdp+1, 0x1.f608c6d603516p+1, 0x1.596bb9d5a879ep+1, -0x1.206dabeb9affap+1, -0x1.ead0cb8f5d5a1p+0, -0x1.03ba6beeeeb42p+1, -0x1.54596cc88c1d6p+1, 0x1.f348679cefb78p+0, 0x1.78a71c4c1ebf1p-3, 0x1.a1f6320ac2e02p-2, -0x1.f2787ccc686dfp+0, -0x1.452e979799af4p+0, -0x1.b1e391cdb6b48p+4, 0x1.bb75b047da4f6p+0, 0x1.6bc6b0c0d5ad2p+0, 0x1.1de388dc6ece1p+0, 0x1.e05738f271a5cp-2, 0x1.2a894f725f278p-2, ]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"


# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Payoff/States - ConvertInf"
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=mle \
#     --convertinf \
#     --est \
#     --simulate \
#     --onlybaseline \
#     --scale=TaxRoyShareScale \
#     --startval='[0.14809034377234664, 6.205839531087852, -2.4329922820523016, 1.2772648172229881, 2.851129045821344, -2.3906668770261668, -3.0063178799458967, -3.1727953945162595, -2.9164600667899463, 1.9673087475311277, -8]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"


# ------------------------------------------------------------
# ------------------------------------------------------------
# ----- Needs help here !!! ------------
# ------------------------------------------------------------
# ------------------------------------------------------------


# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Sample - Only drilled"
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=mle \
#     --sample=only_drilled \
#     --est \
#     --simulate \
#     --onlybaseline \
#     --scale=TaxRoyShareScale \
#     --startval='[0x1.e1f836e80ffb9p+0, -0x1.c9f5acd13ca24p-2, 0x1.44e8f6d8bc25bp-1, 0x1.bb7fef49e0ec8p-2, -0x1.9f86ad994c05ep-5, 0x1.1b3776bb9c3fcp-1, 0x1.3023cc9a76691p-1, 0x1.634b17eae7cbbp-1, 0x1.0c2daa471710ap-1, 0x1.5c6ee13b9e31bp-1, 0x1.769409fec251dp-1, 0x1.9b95715e798b2p-1, 0x1.dd5d6de4f60b4p-1, 0x1.f32bcac99bacbp-1, 0x1.00b3ed53354b4p+0, 0x1.09e5450dbefcp+0, 0x1.04762dd1ae0dcp+0, 0x1.0ae5efaf9357ep+3, -0x1.4d06baf019619p+1, 0x1.212e3c054363p+1, -0x1.a980567751b9p+1, -0x1.56663801b62fap+1, -0x1.0526636131fc5p+1, -0x1.10e3910053ce5p+1, -0x1.be0c6be529c1ap+0, 0x1.81f5bda24c71cp+0, 0x1.2c934dadf866dp-3, 0x1.bfbb24af6f689p-2, -0x1.fdd5564a82203p+0, -0x1.4c30080173ccfp+0, -0x1.bb7ef14181824p+4, 0x1.ba8c2096952a5p+0, 0x1.6abbcd3ebd77ep+0, 0x1.1d0c14d74cd7cp+0, 0x1.24c7ff58fd283p-1, 0x1.2becbe0b2d377p-2, ]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"

# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Sample - Infill"
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --model=full \
#     --sample=infill \
#     --est \
#     --simulate \
#     --onlybaseline \
#     --scale=TaxRoyShareScale \
#     --startval='[25, -0x1.438d53f164b7ep-1, 0x1.e26509c137c17p-2, 0x1.809b979360a91p-2, -0x1.894374e55cbc7p-4, 0x1.109c97892d7c9p-1, 0x1.45a5263658cb8p-1, 0x1.6b5ae07e3a17ep-1, 0x1.511ee513de5bdp-1, 0x1.8f4f899f91eaap-1, 0x1.9ca4880bfa97dp-1, 0x1.c0d38a2c4d03bp-1, 0x1.f7117d28c55f2p-1, 0x1.05ffa7f154572p+0, 0x1.0d7a81a3195cbp+0, 0x1.16de368fe5d5p+0, 0x1.1414d48dc3f45p+0, 0x1.7c8d46661f8c8p+2, -0x1.5f7f8cd109c89p+1, 0x1.21e3334705089p+0, -0x1.390aebc3934c6p-1, -0x1.3fccc3bec0fcbp-1, 0x1.aa913549814cfp-6, 0x1.cfb2650431ee8p-2, -0x1.e806a2616ed4bp+0, -0x1.243df6519ea9p+1, -0x1.b943fb502fc62p+4, 0x1.a98e62bf7e3a4p+0, 0x1.6562ce1fce34cp+0, 0x1.20ed4a552fd0cp+0, 0x1.21db5ce755f18p-2, 0x1.3189b89ef0d96p-2, ]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"

# echo ""
# echo "---------------------------------------------------------------------"
# RUNVARIATION="Sample - Exploratory, HKL"
# echo "$RUNVARIATION"
# echo "---------------------------------------------------------------------"
# echo ""

# julia \
#     --optimize=3 \
#     --project=${SDRM_DIR} \
#     ${SDRM_DIR}/test/work-reorg-args.jl \
#     --pricename=logrealp \
#     --sample=exploratory \
#     --usehkl \
#     --model=full \
#     --est \
#     --posterior \
#     --simulate \
#     --onlybaseline \
#     --scale=TaxRoyShareScale \
#     --startval='[0x1.ff81e74ea4999p+0, 0x1.079a4bbbcb949p+0, 0x1.41378c5be3dcdp-1, 0x1.5f215361979c5p-1, -0x1.fa80ec17382d4p-2, -0x1.a2dfcd60e9138p-3, -0x1.b9d16c58d8d9fp-2, -0x1.3c2ce3c6b91c8p-2, -0x1.eed1742c2ed79p-3, -0x1.d160f72466e0ap-3, -0x1.31da0317b8edfp-3, 0x1.b6e7a1cc6e1f5p+2, -0x1.25088dfdf5e89p+0, 0x1.6c1135d291695p+0, -0x1.fd15808502339p+0, -0x1.a21fb4d0576dap-6, 0x1.35537a1a86dcbp-5, -0x1.49c0c31af166ep+0, -0x1.b247210a2bb17p-1, -0x1.1f633b7a9d5fp+4, 0x1.7eb1f777ce2f3p+0, 0x1.63e1aed36354cp+0, 0x1.1c2c7074ba144p+0, 0x1.5ffba0ed2274cp+0, 0x1.4a96f6a25018fp-2, ]'

# mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
# git add *${SLURM_JOB_ID}*
# git add ./saved-simulations/${SLURM_JOB_ID}*
# git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"


echo ""
echo "---------------------------------------------------------------------"
RUNVARIATION="Sample - HKL"
echo "$RUNVARIATION"
echo "---------------------------------------------------------------------"
echo ""

julia \
    --optimize=3 \
    --project=${SDRM_DIR} \
    ${SDRM_DIR}/test/work-reorg-args.jl \
    --pricename=logrealp \
    --model=full \
    --usehkl \
    --est \
    --simulate \
    --onlybaseline \
    --posterior \
    --scale=TaxRoyShareScale \
    --startval='[0x1.fdc7504f00d1ep+0, 0x1.0eae6b903f5aep+0, 0x1.3a81568ae697bp-1, 0x1.5aaa5bdd2967fp-1, -0x1.09f0bec27eeep-1, -0x1.cce1303edb358p-3, -0x1.c7764c595673p-2, -0x1.4c542de2014f7p-2, -0x1.0d1e7e43dc489p-2, -0x1.f845d11d23cfap-3, -0x1.59e83948c8a92p-3, 0x1.b589beebac0adp+2, -0x1.2bd9809c3e6fcp+0, 0x1.6b12a4c0e409ap+0, 0x1.4e3bccc5f1512p-2, -0x1.fb598f189304cp+0, -0x1.94a0f1e8560c2p-6, 0x1.319d5c1ab8058p-5, -0x1.49cbf18d706f3p+0, -0x1.b171e26ea4874p-1, -0x1.1f627aa75ab7fp+4, 0x1.7ec395939f394p+0, 0x1.63e7fa50dcc74p+0, 0x1.1c2c991b9a85dp+0, 0x1.634a2614140c6p+0, 0x1.4eeb5dd2301fdp-2, ]
'

mv ~/*${SLURM_JOB_ID}*.arrow ./saved-simulations/
git add *${SLURM_JOB_ID}*
git add ./saved-simulations/${SLURM_JOB_ID}*
git commit -m "saving job ${SLURM_JOB_ID} - $RUNVARIATION"
