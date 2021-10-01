#!/bin/bash

datadir=$1
data=$2
model=$3
train_opts=$4
data_opts=$5
epochs=$6
save_interval=$7
test_id=${8}
trainedmodeldir=${9}
recombination=${10}
echo singularity exec --writable-tmpfs --nv /cephyr/NOBACKUP/groups/gcae/tensorflow_21.07-tf2-py3.sif ./train_ae_alvis_inner.sh $1 $2 $3 $4 $5 $6 $7 ${8} ${9}
singularity exec --writable-tmpfs --nv /cephyr/NOBACKUP/groups/gcae/tensorflow_21.07-tf2-py3.sif ./train_ae_alvis_inner.sh $1 $2 $3 $4 $5 $6 $7 ${8} ${9}
