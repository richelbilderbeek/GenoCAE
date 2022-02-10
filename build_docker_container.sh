#!/bin/bash
#
# Build the Docker container.
#
# Usage:
#
# ./build_docker_container.sh
#
#

sudo docker container create -t gcae/genocae:build -f docker/build.dockerfile gcae --name gcae .

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done creating Dockerfile" "Done creating Dockerfile"
fi



