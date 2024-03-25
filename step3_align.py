import prody as pdy


# Takes in a list of pdb files and aligns them to each other and returns a distance matrix of the RMSD values.

def align(pdb_files) -> list:
    """
    Input: List of pdb files in given directory.
    Output: Distance matrix of RMSD values.
    """
    # Create an empty list of prody structures.
    structures = []

    # Load pdb files into prody structures.
    for file in pdb_files:
        structure = pdy.parsePDB(file)
        structures.append(structure)

    # Align each structure to the first structure.
    for i in range(1, len(structures)):
        first, _ = pdy.superpose(structures[0], structures[i])
        pdy.calcRMSD(first, structures[i])
align(["1a52.pdb", "1err.pdb"])

    
