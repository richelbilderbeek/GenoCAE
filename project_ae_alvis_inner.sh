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

jobname=ae.$3.$4.$5.$2.p1

pip3 install docopt grpcio numpy scikit-learn matplotlib\>=3.2.1 seaborn scipy==1.4.1 pandas-plink==2.0.4 pandas==1.0.4 numba tensorflow.probability
## Recombination
#python3 -u ./model_scripts/${SLURM_JOB_NAME}.py project \
#python3 -u ${SLURM_JOB_NAME}.py project \
python3 -u run_gcae.py project \
--datadir $datadir \
--trainedmodelname $jobname \
--trainedmodeldir $trainedmodeldir 
#--superpops example_tiny/HO_superpopulations
#--recombination $recombination

#--data $data \
#--model_id $model \
#--train_opts_id $train_opts \
#--data_opts_id $data_opts \


python3 -u run_gcae.py evaluate \
--metrics "hull_error,f1_score_3" \
--datadir $datadir \
--trainedmodelname $jobname \
--trainedmodeldir $trainedmodeldir #\
#--superpops example_tiny/HO_superpopulations

## Code from applied bioinformatics:
#cp run_gcae.py ${SLURM_JOB_NAME}.py
#mv ${SLURM_JOB_NAME}.py ../appliedBioinformarics/
## Original code
#cp run_ae_decoupled.py ${SLURM_JOB_NAME}.py
#-u  ${SLURM_JOB_NAME}.py train \
#--datadir $datadir \

### Our version for training that works
#python3 -u run_gcae.py train \
#--datadir example_tiny/ \
#--data $data \
#--model_id $model \
#--train_opts_id $train_opts \
#--data_opts_id $data_opts \
#--save_interval $save_interval \
#--epochs $epochs \
#--trainedmodeldir $trainedmodeldir

## More of the original code
#--test_id $test_id \
#--stop_grad=False \
#--resume_from 20000 \
#--resume_from_mod 20000

### Just testing project (in wrong file but still)
#python3 -u run_gcae.py project \
#--datadir example_tiny/ \
#--data HumanOrigins249_tiny \
#--model_id M1 \
#--train_opts_id ex3 \
#--data_opts_id b_0_4 \
#--superpops example_tiny/HO_superpopulations

### Just testing plotting (in wrong file)
#python3 -u run_gcae.py plot \
#--datadir example_tiny/ \
#--trainedmodelname ae.M1.ex3.b_0_4.HumanOrigins249_tiny
#--superpops example_tiny/HO_superpopulations

### Just testing animating (in wrong file)
#python3 -u run_gcae.py animate \
#--datadir example_tiny/ \
#--trainedmodelname ae.M1.ex3.b_0_4.HumanOrigins249_tiny
#--superpops example_tiny/HO_superpopulations

### Just testing evaluating (in wrong file)
#python3 -u run_gcae.py evaluate \
#--metrics "hull_error,f1_score_3" \
#--datadir example_tiny/ \
#--trainedmodelname ae.M1.ex3.b_0_4.HumanOrigins249_tiny
#--superpops example_tiny/HO_superpopulations
