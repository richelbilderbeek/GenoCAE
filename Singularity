Bootstrap: docker
From: nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04
Stage: spython-base

%files
requirements.txt /workspace/requirements.txt
run_gcae.txt /workspace/run_gcae.txt

%labels
maintainer="Richel Bilderbeek"

%post
CUDA_VERSION=11.1.1
OS_VERSION=20.04

PATH="/root/miniconda3/bin:${PATH}"
DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get upgrade -y && \
apt-get install -y wget python3-pip

python3 -m pip install --upgrade pip

python3 -m pip install -r /workspace/requirements.txt

python3 -m pip list

python3 /workspace/run_gcae.py --help

%environment
export PATH="/root/miniconda3/bin:${PATH}"

%runscript
exec python3 "$@"

%startscript
exec python3 "$@"
