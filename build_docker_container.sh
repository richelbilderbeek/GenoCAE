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
# sudo docker save -t gcae/genocae:build | gzip > gcae_docker_container.tar.gz

sudo docker save gcae/genocae:build -o gcae_docker_container.tar.gz

if [[ $HOSTNAME == "N141CU" ]]; then
  notify-send "Done creating Dockerfile" "Done creating Dockerfile"
fi



