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

# Use Python 3.8.6, thanks https://github.com/python-poetry/poetry/issues/2629#issuecomment-797838553
sudo docker build -t gcae/genocae:build -f docker/build.dockerfile .

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done creating Dockerfile" "Done creating Dockerfile"
fi



