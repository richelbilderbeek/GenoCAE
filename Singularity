Bootstrap: docker
From: nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04
Stage: spython-base

%files
    requirements.txt /opt/gcae/requirements.txt
    run_gcae.py /opt/gcae/run_gcae.py
    data_opts/d_0_4.json /opt/gcae/data_opts/d_0_4.json
    data_opts/a.json /opt/gcae/data_opts/a.json
    data_opts/c_0_4.json /opt/gcae/data_opts/c_0_4.json
    data_opts/c.json /opt/gcae/data_opts/c.json
    data_opts/b_0_4.json /opt/gcae/data_opts/b_0_4.json
    data_opts/b.json /opt/gcae/data_opts/b.json
    data_opts/a_0_4.json /opt/gcae/data_opts/a_0_4.json
    data_opts/b_0_4_n.json /opt/gcae/data_opts/b_0_4_n.json
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
    models/p2.json /opt/gcae/models/p2.json
    models/p1.json /opt/gcae/models/p1.json
    models/p0.json /opt/gcae/models/p0.json
    models/M3d.json /opt/gcae/models/M3d.json
    models/M3e.json /opt/gcae/models/M3e.json
    models/M1.json /opt/gcae/models/M1.json
    models/M0.json /opt/gcae/models/M0.json
    models/M3f.json /opt/gcae/models/M3f.json
    train_opts/ex3.json /opt/gcae/train_opts/ex3.json
    train_opts/ex2.json /opt/gcae/train_opts/ex2.json
    train_opts/ex1.json /opt/gcae/train_opts/ex1.json
    train_opts/CCE224_L04_R10_N02_B05_E13.json /opt/gcae/train_opts/CCE224_L04_R10_N02_B05_E13.json
    utils/data_handler.py /opt/gcae/utils/data_handler.py
    utils/__init__.py /opt/gcae/utils/__init__.py
    utils/layers.py /opt/gcae/utils/layers.py
    utils/normalization.py /opt/gcae/utils/normalization.py
    utils/visualization.py /opt/gcae/utils/visualization.py
    utils/visualization.py /opt/gcae/utils/visualization.py

%post
    CUDA_VERSION=11.1.1
    OS_VERSION=20.04
    PATH="/root/miniconda3/bin:${PATH}"
    DEBIAN_FRONTEND=noninteractive

    apt-get update && apt-get upgrade -y && \
    apt-get install -y wget python3-pip

    # python3 -m pip install --upgrade pip
    # Tip from Pavlin Mitev
    python3 -m pip install --no-cache-dir --upgrade pip

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

