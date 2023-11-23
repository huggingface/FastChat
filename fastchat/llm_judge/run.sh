#!/bin/bash

set -x -e

HUB_MODEL_ID=$1
[ -z "$2" ] && REVISION="main" || REVISION=$2
[ -z "$3" ] && DTYPE="float16" || DTYPE=$3
MT_BENCH_ID=$4

# Generate answer
python gen_model_answer.py --model-path $HUB_MODEL_ID --model-revision $REVISION --dtype $DTYPE --model-id $MT_BENCH_ID

# Judge!
python gen_judgment.py --model-list $MT_BENCH_ID

# Get results
python show_result.py