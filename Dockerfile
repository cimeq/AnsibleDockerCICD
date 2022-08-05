FROM ubuntu:jammy AS baseBuild
LABEL maintainer="Alexandre Salconi-Denis <asalconi@cimeq.qc.ca>"
LABEL Description="Image for runing ansible in a Jenkins CICD"


# Install any needed packages specified in requirements.txt
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
# Development files
    git \
    python3-pip \
    python-is-python3 \
    sshpass \
    && apt clean

#RUN alias python=python3
RUN python -m pip install ansible


FROM baseBuild AS ansibleCICD
LABEL maintainer="Alexandre Salconi-Denis <asalconi@cimeq.qc.ca>"
LABEL Description="Image for runing ansible in a Jenkins CICD"

RUN ansible --version

