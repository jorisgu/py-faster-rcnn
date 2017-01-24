#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

GPU_ID=0
NAME_DATASET="nyud_v2_40gupta"
NETWORK=$1
SET=$2
PATH_BINARY=$3
NAME_TEST_IMDB=$4

EXP_DIR="output/rgbIntensity_${NAME_DATASET}/${NETWORK}/${SET}/"
mkdir -p ${EXP_DIR}
LOG_FILE="${EXP_DIR}log.txt"
exec &> >(tee -a "$LOG_FILE")

# stage 1.1 Compute test (no evaluation) : generate test outputs
PATH_PROTO="models/nyud_v2_40gupta/VGG_CNN_M_1024/faster_rcnn_alt_opt/faster_rcnn_test.pt"
PATH_CONFIG_FILE="experiments/cfgs/nyud_v2_40gupta/netTest.yml"
OUTPUT_FILE_NAME="outputs.pkl"

./tools/jg_net_generate.py \
  --gpu_id ${GPU_ID} \
  --path_net_proto ${PATH_PROTO} \
  --path_net_weights output/${PATH_BINARY} \
  --imdb_name ${NAME_TEST_IMDB} \
  --path_cfg ${PATH_CONFIG_FILE} \
  --output_dir ${EXP_DIR}\
  --output_file_name ${OUTPUT_FILE_NAME}




# stage 1.2 Eval test from net test outputs
mkdir -p "${EXP_DIR}results"

./tools/jg_net_evaluate.py \
  --imdb_name ${NAME_TEST_IMDB} \
  --output_dir ${EXP_DIR}\
  --input_file_name ${OUTPUT_FILE_NAME}