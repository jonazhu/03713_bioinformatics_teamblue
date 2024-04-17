#!/bin/bash

#shell to install ESMFold based on the guidelines posted by the TA.
#if this is wrong, tough luck.
module load AI

git clone https://github.com/facebookresearch/esm.git
conda env create -f esmfold/environment.yml
conda activate esmfold

conda install -c conda-forge einops=0.6.1
module load cuda/11.7.1

pip install "fair-esm[esmfold]"
pip install 'dllogger @ git+https://github.com/NVIDIA/dllogger.git'
pip install 'openfold @ git+https://github.com/aqlaboratory/openfold.git@4b41059694619831a7db195b7e0988fc4ff3a307'
pip install git+https://github.com/facebookresearch/esm.git

mkdir torch_cache