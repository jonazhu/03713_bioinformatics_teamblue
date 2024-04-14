import os
import argparse
import subprocess
parser = argparse.ArgumentParser()
# an argument for the pdb file
parser.add_argument("pdb_file", help="Path to the PDB file")

# an argument for the number of the residue
parser.add_argument("residue_number", help="Number of the residue")
args = parser.parse_args()

# Get the arguments
pdb_file = args.pdb_file
residue_number = args.residue_number

pm = pymol.PyMOL()
pm.start()
pm.cmd.(f"load {pdb_file}")
pm.run("colorh.py")




pm.stop()
