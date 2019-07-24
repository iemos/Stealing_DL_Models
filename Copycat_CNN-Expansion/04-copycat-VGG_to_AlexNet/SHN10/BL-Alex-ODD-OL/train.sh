#!/bin/bash

#CAFFE:
CAFFE_BIN=`which caffe`

#VGG:
VGG_PATH=$PWD

#PROTOTXT FILES:
PROTOTXT_PATH="$VGG_PATH/prototxt"
SOLVER="$PROTOTXT_PATH/solver.prototxt"
WEIGHTS='../../bvlc_alexnet.caffemodel'
GPU=2

LOG_FILE=$(date "+log-%Y_%m_%d-%H_%M.txt")

echo "Using:
VGG_PATH = $VGG_PATH
SOLVER   = $SOLVER
WEIGHTS  = $WEIGHTS
GPU      = $GPU
"
read -n1 -p 'Press ENTER to start training... '

$CAFFE_BIN train --solver=$SOLVER --weights=$WEIGHTS -gpu=$GPU 2>&1 | tee $LOG_FILE
