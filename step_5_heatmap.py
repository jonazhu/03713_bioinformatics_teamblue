#Structural and Sequence RMSD Heatmap
# This script will generate a heatmap of the RMSD values between the structures in the input file
# The input file should be a .txt file with a square matrix of RMSD values
# The script will output a heatmap of the RMSD values

import sys
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

# Check for correct number of arguments
if len(sys.argv) != 2:
    print("Usage: python3 heatmap.py <input_file>")
    sys.exit()

# Read in input file   
input_file = sys.argv[1]
with open(input_file, "r") as f:
    rmsd = f.readlines()

# check if matrix is square
n = len(rmsd)
m = len(rmsd[0].split())
for line in rmsd:
    if m != n:
        print("Matrix is not square")
        sys.exit()


# Create list of RMSD values
rmsd_values = []
for line in rmsd:
    rmsd_values.append([float(x) for x in line.split()])

# Create a numpy array of the RMSD values
rmsd_array = np.array(rmsd_values)

# Create a heatmap of the RMSD values
sns.set(font_scale=1.5)
sns.heatmap(rmsd_array, cmap="coolwarm", xticklabels=True, yticklabels=True)
plt.title("RMSD Heatmap")
plt.show()
plt.savefig("RMSD_heatmap.png")
plt.close()



