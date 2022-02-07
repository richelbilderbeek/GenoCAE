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
$docker_container_filename=

if [ ! -f $docker_container_filename ]; then
  echo "'docker_container_filename' file not found at path $docker_container_filename"
  echo "Creating it ..."
  ./build_docker_container.sh
fi

if [ ! -f $docker_container_filename ]; then
  echo "Docker container is not created at $docker_container_filename"
  exit 42
fi

spython recipe docker/build.dockerfile &> Singularity

sudo -E singularity build gcae.sif Singularity

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done creating 'gcae.sif'" "Done creating 'gcae.sif'"
fi


