ARG CUDA_VERSION=11.1.1
ARG OS_VERSION=20.04

FROM nvidia/cuda:${CUDA_VERSION}-cudnn8-devel-ubuntu${OS_VERSION}

LABEL maintainer="Dong Wang"


ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget

# Python
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh

# Use Python 3.8.6, thanks https://github.com/python-poetry/poetry/issues/2629#issuecomment-797838553
# RUN apt-get install -y python3.8-dev

# Use Python 3.8.6, thanks https://stackoverflow.com/a/57940873
# RUN conda install python=3.8.6

# Use Python 3.8.5, as it is on https://anaconda.org/cctbx202008/python
# RUN conda install -c cctbx202008 python

# Use Python 3.7.4, as it is on https://anaconda.org/cctbx202008/python
# RUN conda install -c mirror-test python

# From error message
# DOES NOT WORK: need to init conda, which will always fail
# RUN conda init bash
# RUN conda init fish
# RUN conda init tcsh

# From https://stackoverflow.com/a/57940873
# DOES NOT WORK: need to init conda, which will fail
# RUN conda create --name py365 python=3.6.5 --channel conda-forge
# RUN conda activate py365

# Unneeded, as nothing works :-(
# RUN python3 --version


RUN pip3 install --upgrade pip

# From https://askubuntu.com/a/1049465
RUN pip3 install --upgrade setuptools

WORKDIR /workspace
ADD ./requirements.txt /workspace
RUN pip3 install -r /workspace/requirements.txt and &&\
	rm /workspace/requirements.txt

CMD ["/bin/bash"]
