FROM ubuntu:noble AS basebuild
LABEL maintainer="Lara Salconi-Denis <lsalconi@cimeq.qc.ca>"
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
RUN python -m pip install ansible --break-system-packages


FROM basebuild AS ansiblecicd
LABEL maintainer="Lara Salconi-Denis <lsalconi@cimeq.qc.ca>"
LABEL Description="Image for runing ansible in a Jenkins CICD"

RUN groupadd -g 111 cicd && \
    useradd -m -u 111 -g cicd cicd
USER cicd
WORKDIR /home/cicd
WORKDIR /project

ENV HOME=/home/cicd
RUN ansible --version

