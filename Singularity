Bootstrap: docker
From: nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04
Stage: spython-base

%files
requirements.txt /workspace/requirements.txt
run_gcae.py /workspace/run_gcae.py
utils/data_handler.py /workspace/utils/data_handler.py
utils/__init__.py /workspace/utils/__init__.py
utils/layers.py /workspace/utils/layers.py
utils/normalization.py /workspace/utils/normalization.py
utils/visualization.py /workspace/utils/visualization.py
utils/visualization.py /workspace/utils/visualization.py
example_tiny/HO_superpopulations /workspace/example_tiny/HO_superpopulations
example_tiny/HumanOrigins249_tiny.bed /workspace/example_tiny/HumanOrigins249_tiny.bed
example_tiny/HumanOrigins249_tiny.bim /workspace/example_tiny/HumanOrigins249_tiny.bim
example_tiny/HumanOrigins249_tiny.eigenstratgeno /workspace/example_tiny/HumanOrigins249_tiny.eigenstratgeno
example_tiny/HumanOrigins249_tiny.fam /workspace/example_tiny/HumanOrigins249_tiny.fam
example_tiny/HumanOrigins249_tiny.ind /workspace/example_tiny/HumanOrigins249_tiny.ind
example_tiny/HumanOrigins249_tiny.snp /workspace/example_tiny/HumanOrigins249_tiny.snp
example_tiny/issue_6_bin.bed /workspace/example_tiny/issue_6_bin.bed
example_tiny/issue_6_bin.bim /workspace/example_tiny/issue_6_bin.bim
example_tiny/issue_6_bin.fam /workspace/example_tiny/issue_6_bin.fam
example_tiny/issue_6_bin.phe /workspace/example_tiny/issue_6_bin.phe

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

%test
    echo "*******************************"
    echo "Testing GCAE"
    echo "*******************************"
    python3 /workspace/run_gcae.py --help

%runscript
exec python3 /workspace/run_gcae.py "$@"

%startscript
exec python3 /workspace/run_gcae.py "$@"
