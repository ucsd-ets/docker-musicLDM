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

RUN pip install --no-cache-dir networkx scipy librosa==0.10.0 wave soundfile pytorch-lightning==1.9.4
RUN pip install --no-cache-dir lightning-utilities==0.7.1 

# Clone and install the taming-transformers repository
# RUN apt-get update && apt-get install -y git
# RUN git clone https://github.com/CompVis/taming-transformers.git /taming-transformers
# RUN pip install -e /taming-transformers

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
