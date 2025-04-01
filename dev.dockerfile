FROM mcr.microsoft.com/devcontainers/typescript-node:22

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get -y install git
RUN mkdir /workspace
RUN sudo chmod -R 777 /workspace