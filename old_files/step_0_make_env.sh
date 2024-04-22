#!/bin/bash

conda create --name ppp_env python=3.11

conda activate ppp_env # Protein Prediction Pipeline

# Install packages using pip
pip install pdb2pqr lightdock