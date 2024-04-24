CONDA_SUBDIR=osx-64 conda create -n protpredlocal #-f local_env.yml
conda init --all
conda activate protpredlocal
CONDA_SUBDIR=osx-64 conda env update -n protpredlocal --file local_env.yml
chmod +x protpred_local.sh
