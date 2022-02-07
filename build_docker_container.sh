#!/bin/bash
#
# Build the Singularity container called `gcae.sif`
# from the Singularity recipe `Singularity` (which is a default
# name for a Singularity recipe)
#
# Usage:
#
# ./build_docker_container.sh
#
#
sudo docker build  - < docker/build.dockerfile

exit 42

spython recipe docker/build.dockerfile &> Singularity

sudo -E singularity build gcae.sif Singularity

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done creating 'gcae.sif'" "Done creating 'gcae.sif'"
fi



