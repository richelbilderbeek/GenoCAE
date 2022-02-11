#!/bin/bash
#
# Build the Singularity container called `gcae.sif`
# from the Singularity recipe `Singularity` (which is a default
# name for a Singularity recipe)
#
# Usage:
#
# ./scripts/build_singularity_container.sh
#
#

sudo -E singularity build gcae.sif Singularity

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done creating 'gcae.sif'" "Done creating 'gcae.sif'"
fi

exit 0

#
# Use the script below to re-generate the Singularity file
# 

spython recipe docker/build.dockerfile &> Singularity

# The Singularity container will have this line:
#
# From: nvidia/cuda:11.1.1-cudnn8-devel-ubuntu11.1.1
#
# This is a bug where spython replaces variables incorrectly. 
# Correct is:
#
# From: nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04	
#
# The bug is reported at 
# https://github.com/singularityhub/singularity-cli/issues/187
#
sed -i 's/ubuntu11.1.1/ubuntu20.04/g' Singularity

# Remove this line,
#
# SHELL ["/bin/bash", "-c"]
#
# by deleting it
#
sed -i 's/^SHELL.*$//g' Singularity


# Remove this line,
#
# cd /workspace
#
# by deleting it
#
sed -i 's/^cd .workspace$//g' Singularity

# The section '%files' becomes:
#
# ./requirements.txt /workspace
#
# Must become:
#
# requirements.txt /workspace/requirements.txt
# # requirements.txt /requirements.txt
# # ./requirements.txt /requirements.txt
# # ./requirements.txt ./requirements.txt
#
# Use | as seperator
#
sed -i 's|^..requirements.txt .workspace$|requirements.txt /workspace/requirements.txt|g' Singularity

sudo -E singularity build gcae.sif Singularity

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done creating 'gcae.sif'" "Done creating 'gcae.sif'"
fi

