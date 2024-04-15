#!/bin/bash

module load AI
conda activate esmfold
export TORCH_HOME=/ocean/projects/bio230007p/jzhuf/torch_cache
python test_esm.py $1