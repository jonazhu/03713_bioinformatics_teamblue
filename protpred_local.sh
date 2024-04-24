#!/bin/bash
# This script takes in a directory of protein structures and performs analysis on the predicted structures.

# Assumes that conda has already been activated with environment protpredlocal.


# Step 3 - Do RMSD analysis on predicted structures.
echo "Performing RMSD calculations"
mkdir local_analysis
python3 step_3_align.py $1
mv distance_matrix.txt local_analysis
mv pdb_files_order.txt local_analysis


# Step 3.1 Run APBS on the predicted structures.
echo "PERFORMING APBS CALCULATIONS"
mkdir APBS
files=$(ls $1/*.pdb)
# Read in list of mutations from mut.txt of givven folder.
#cut -f 1 -d ' ' $1/muts.txt 
IFS=$'\n' read -d '' -r -a muts < <(awk '{print $1}' "$1/muts.txt" && printf '\0')
count=0
for mut in "${muts[@]}"; do
    echo "$mut"
done

for file in $files; do
	if (( $count == 0 )); then
		echo "Processing wild type!"
		cp $file ./
		for mut in ${muts[@]}; do
			filename="$(basename "$file")"
			pymol step_3_1_apbs.py -- $filename $mut result0_${count}_${mut}.png
		done
		rm $filename
	elif (($count>=1)); then
		echo "Processing mutant structure!"
		filename="$(basename "$file")"
		cp $file ./${filename}
		echo "pymol step_3_1_apbs.py -- ${filename} ${muts[count-1]} ${filename}.png"
		pymol step_3_1_apbs.py -- ${filename} ${muts[count-1]} ${filename}.png
		rm ${filename}
	fi
	let "count++"
done

mv APBS local_analysis

# Step 4 - Perform light dock.
echo "Performing lightdock calculations"
for file in $files; do
	echo $file
	python3 step_4_docking.py $file $2
done


## Step 5 - Create the heatmap.
echo "Creating heatmap"
cp local_analysis/distance_matrix.txt ./
python3 step_5_heatmap.py distance_matrix.txt
mv RMSD_heatmap.png local_analysis
rm distance_matrix.txt



# Step 5 - Do coloring via hydrophobicity.
echo "Performing coloring via hydrophobicity"
for file in $1/*.pdb; do
	python3 step_5_props.py $file
done

echo "Analysis complete!"
echo "Please check the local_analysis folder for the results."
