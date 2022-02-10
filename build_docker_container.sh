#!/bin/bash
#
# Build the Docker container.
#
# Usage:
#
# ./build_docker_container.sh
#
#

# sudo docker container create -t gcae/genocae:build -f docker/build.dockerfile gcae --name gcae .
# sudo docker run --name gcae/genocae:build -p 80:80 -d ubuntu:Apache_Server
# sudo docker run --name gcae -p 80:80 -d gcae/genocae:build

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done creating Dockerfile" "Done creating Dockerfile"
fi



