Bootstrap: docker
From: nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04
Stage: spython-base

%files
    requirements.txt /opt/gcae/requirements.txt
    run_gcae.py /opt/gcae/run_gcae.py
    utils/data_handler.py /opt/gcae/utils/data_handler.py
    utils/__init__.py /opt/gcae/utils/__init__.py
    utils/layers.py /opt/gcae/utils/layers.py
    utils/normalization.py /opt/gcae/utils/normalization.py
    utils/visualization.py /opt/gcae/utils/visualization.py
    utils/visualization.py /opt/gcae/utils/visualization.py
    example_tiny/HO_superpopulations /opt/gcae/example_tiny/HO_superpopulations
    example_tiny/HumanOrigins249_tiny.bed /opt/gcae/example_tiny/HumanOrigins249_tiny.bed
    example_tiny/HumanOrigins249_tiny.bim /opt/gcae/example_tiny/HumanOrigins249_tiny.bim
    example_tiny/HumanOrigins249_tiny.eigenstratgeno /opt/gcae/example_tiny/HumanOrigins249_tiny.eigenstratgeno
    example_tiny/HumanOrigins249_tiny.fam /opt/gcae/example_tiny/HumanOrigins249_tiny.fam
    example_tiny/HumanOrigins249_tiny.ind /opt/gcae/example_tiny/HumanOrigins249_tiny.ind
    example_tiny/HumanOrigins249_tiny.snp /opt/gcae/example_tiny/HumanOrigins249_tiny.snp
    example_tiny/issue_6_bin.bed /opt/gcae/example_tiny/issue_6_bin.bed
    example_tiny/issue_6_bin.bim /opt/gcae/example_tiny/issue_6_bin.bim
    example_tiny/issue_6_bin.fam /opt/gcae/example_tiny/issue_6_bin.fam
    example_tiny/issue_6_bin.phe /opt/gcae/example_tiny/issue_6_bin.phe

%post
    CUDA_VERSION=11.1.1
    OS_VERSION=20.04
    PATH="/root/miniconda3/bin:${PATH}"
    DEBIAN_FRONTEND=noninteractive

    apt-get update && apt-get upgrade -y && \
    apt-get install -y wget python3-pip

    python3 -m pip install --upgrade pip

    python3 -m pip install -r /opt/gcae/requirements.txt

    python3 -m pip list

    python3 /opt/gcae/run_gcae.py --help

%environment
    export PATH="/root/miniconda3/bin:${PATH}"

%test
    echo "*******************************"
    echo "Testing GCAE"
    echo "*******************************"
    python3 /opt/gcae/run_gcae.py --help

%runscript
    exec python3 /opt/gcae/run_gcae.py "$@"

%startscript
    exec python3 /opt/gcae/run_gcae.py "$@"

%help

This container has the GenoCAE Python code installed in the folder '/opt/gcae'.

To use GenoCAE, run the container with the desired GenoCAE arguments:

```
singularity run gcae.sif --help
```

%labels

    AUTHOR Richel J.C. Bilderbeek

    NAME gcae

    DESCRIPTION GenoCAE is a convolutional autoencoder developed by  Kristiina Ausmees and Carl Nettelblad

    USAGE run the container with the desired GenoCAE arguments

    URL https://github.com/richelbilderbeek/GenoCAE/tree/Pheno

    VERSION 0.1

