#!/bin/bash

echo "Starting ProtPred Pipeline."
echo "Processing proteins..."
python step1_final.py $1 $2 $3
echo "Protein ssequences obtained."
echo "Running ESMFold..."
mkdir $4
cd $4
bash ../step2_esm.sh ../homomer.fasta
cd ../
echo "ESMFold finished running. Use resulting directory of PDB files on a local machine with PyMol."
