#!/bin/bash

echo "Starting ProtPred Pipeline."
echo "Activating environments..."
conda activate esmfold
echo "Conda environment esmfold activated."
echo "Processing proteins..."
python step1_final.py $1 $2 $3
echo "Protein ssequences obtained."
echo "Running ESMFold..."
bash step2_esm.sh homomer.fasta $4
echo "ESMFold finished running. Use resulting directory of PDB files on a local machine with PyMol."
