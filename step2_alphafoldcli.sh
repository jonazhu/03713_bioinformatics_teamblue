#!/bin/bash

python get_fastas.py $1
python3 docker/run_docker.py \
  --fasta_paths=homomer.fasta \
  --max_template_date=2021-11-01 \
  --model_preset=multimer \
  --data_dir=$DOWNLOAD_DIR \
  --output_dir=/home/user/$2