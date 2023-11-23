#!/bin/bash

set -x -e
HUB_MODEL_ID=$1
MT_BENCH_ID=$2
[ -z "$3" ] && DTYPE="float16" || DTYPE=$3

# Generate answer
python gen_model_answer.py --model-path $HUB_MODEL_ID --model-id $MT_BENCH_ID --dtype $DTYPE

# Judge!
python gen_judgment.py --model-list $MT_BENCH_ID

# Get results
python show_result.py