#!/bin/bash
#SBATCH -A SNIC2020-33-11 -p alvis
#SBATCH --gpus-per-node=T4:1
#SBATCH -t 6-00:59:00

operation=$1
resume_no=${2}

# directory where trained models are stored
outdir=./ae_out/
# directory where output and error logs are stored
logdir=./logs/
########################## setup ###########################
## From the tiny example on Git
model_id=${model_id:M3e}
#train_opts_id=ex3
train_opts_id=CCE${NUM:-137}_L04_R10_N02_B05_E13
data_opts_id=d_0_4
## Original code
#model_id=Ea_1_i3sg_nms_sm_vae_4_ups10
#train_opts_id=ce_x2_a_y_6ex413_3_small
##train_opts_id=mae_25_nonoise_mod_noreg_hlr_ldecay
#data_opts_id=cd
#model_id=Ea_3_i2
#t./in_opts_id=ce_20_x2_e_y_6ex1_3
#data_opts_id=b
##############################
## From the tiny example on Git
epochs=40000
save_interval=500
recombination=1
## Original code
#epochs=20000
#save_interval=500
##############################
## Original data
#datadir=../WheatData/
#data=Genopheno_V2
## Our data
#datadir=example_tiny/
#data=HumanOrigins249_tiny
datadir=data_all/
#data=HumanOrigins2067_filtered
data=issue_2_bin
if [ -z "$test_id" ]
	then
		test_id=145
fi

#data=HumanOrigins2067_filtered
#datadir=/proj/snic2019-8-38/nobackup/private/ae_data/
#superpops_file=example_tiny/HO_superpopulations

##############################
#resource=snowy
#resource=rackham
resource=alvis
#project=uppmax2020-2-5
project=SNIC2020-33-11
time="167:59:00"
#time="0:59:00"
# 1 day 12 hours
#time="1-12:00:00"
# number of cores

###########################################################
#mkdir $logdir
############################ train ##########################
if [ $operation == "train" ]
then
	cores=8
	taskname=train.$model_id.$train_opts_id.$data_opts_id.${test_id}.$data
	echo Launching $taskname $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
	sbatch --open-mode=append --gres=gpu:T4:1 -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname train_ae_alvis.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir 
	
	#$recombination

	# ! using a whole node !
	#sbatch -M $resource -A snic2019-8-38 -p node -n 1 -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname train_ae_uppmax.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
fi

if [ $operation == "train_cm" ]
then
	cores=8
	taskname=train_cm.$model_id.$train_opts_id.$data_opts_id.${test_id}.$data
	echo Launching $taskname $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
	sbatch --open-mode=append --gres=gpu:V100:1 -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname train_ae_alvis_cm.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir $recombination

	# ! using a whole node !
	#sbatch -M $resource -A snic2019-8-38 -p node -n 1 -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname train_ae_uppmax.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
fi

if [ $operation == "train_resume" ]
then
	cores=8
	taskname=train.$model_id.$train_opts_id.$data_opts_id.${test_id}.$data
	echo Launching $taskname $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
	sbatch --open-mode=append --gres=gpu:T4:1 -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname train_resume_ae_alvis.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir $resume_no $recombination
fi

if [ $operation == "traincpu" ]
then
	cores=4
	project=snic2020-15-43
		taskname=train.$model_id.$train_opts_id.$data_opts_id.$data
		echo Launching $taskname $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
		sbatch -M $resource -A $project -p core -n $cores -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname train_ae_uppmax.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir

		# ! using a whole node !
		#sbatch -M $resource -A snic2019-8-38 -p node -n 1 -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname train_ae_uppmax.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
fi

if [ $operation == "traindev" ]
then
	time="0:59:00"
	project=snic2020-15-43
	cores=8
		taskname=train.$model_id.$train_opts_id.$data_opts_id.$data
		echo Launching $taskname $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
		sbatch -M $resource -A $project -p devcore -n $cores -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname train_ae_uppmax.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir

		# ! using a whole node !
		#sbatch -M $resource -A snic2019-8-38 -p node -n 1 -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname train_ae_uppmax.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
fi
#############################################################

############################ project ##########################
if [ $operation == "project" ]
then
	project=snic2020-15-43
	cores=4
		time="1:59:00"
		taskname=project.$model_id.$train_opts_id.$data_opts_id.$data.no
		echo Launching $taskname
		sbatch --gres=gpu:T4:1 -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname project_ae_alvis.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
fi

if [ $operation == "projectnow" ]
then
	project=snic2020-15-43
	cores=4
		time="23:59:00"
		taskname=project.$model_id.$train_opts_id.$data_opts_id.$data.no
		echo Launching $taskname
		./project_ae_alvis.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir
fi
###############################################################

############################ evaluate ##########################
if [ $operation == "evaluate" ]
then
	project=snic2020-15-43
	cores=4
		time="23:59:00"
		taskname=evaluate.$model_id.$train_opts_id.$data_opts_id.$data
		echo Launching $taskname
		sbatch --gres=gpu:T4:1 -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname evaluate_ae_alvis.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir $recombination
fi

if [ $operation == "evaluate_superpop" ]
then
	project=snic2020-15-43
	cores=4
		time="23:59:00"
		taskname=evaluate_superpop.$model_id.$train_opts_id.$data_opts_id.$data
		echo Launching $taskname
		sbatch --gres=gpu:T4:1 -t $time -e ${logdir}${taskname}.error -o ${logdir}${taskname}.output -J $taskname evaluate_ae_alvis_superpop.sh $datadir $data $model_id $train_opts_id $data_opts_id $epochs $save_interval $test_id $outdir $recombination
fi
###################################################################
