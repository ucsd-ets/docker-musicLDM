# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
# coercing image build
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/scipy-ml-notebook:2024.2-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get -y install htop

# 3) install packages using notebook user
USER jovyan

# RUN conda install -y scikit-learn

RUN pip install --no-cache-dir networkx scipy librosa==0.10.0 wave==0.0.2 soundfile==0.12.1 pytorch-lightning==1.9.4 
RUN pip install --no-cache-dir lightning-utilities==0.7.1 
# extra ones that I pip3 installed
RUN pip install --no-cache-dir torchlibrosa==0.1.0 braceexpand==0.1.7 webdataset==0.2.35 wget==3.2
# pip3 install --user transformers==4.30.2

# for taming-transformers #
# pip3 install --user taming-transformers

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
