import os
import argparse
import subprocess


# 
# Create a directory called lightdock if the folder doesn't exist
if not os.path.exists("lightdock"):
    os.mkdir("lightdock")


# Read in two arguments filename of receptor and filename of ligand
parser = argparse.ArgumentParser()
parser.add_argument("receptor", help="filename of receptor")
parser.add_argument("ligand", help="filename of ligand")

args = parser.parse_args()

receptor = args.receptor
ligand = args.ligand


# Copy the receptor and ligand files into lightdock
os.system("cp " + receptor + " lightdock")
os.system("cp " + ligand + " lightdock")

# Run the docking
os.chdir("lightdock")


subprocess.run(["lightdock3_setup.py", receptor, ligand])


# Run the docking
subprocess.run(["lightdock3.py", "setup.json", "10"])



# Generate conformations
subprocess.run(["lgd_generate_conformations.py", receptor, ligand, "swarm_0/gso_10.out", "10"])

# Cluster conformations
subprocess.run(["lgd_cluster_bsas.py", "swarm_0/gso_10.out"])
