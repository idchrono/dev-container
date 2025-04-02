FROM mcr.microsoft.com/devcontainers/python:3.12


RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get -y install git

# workspace
RUN mkdir /workspace
RUN sudo chmod -R 777 /workspace

# ssh access
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
COPY ./dockerkey.pub /root/.ssh/authorized_keys
EXPOSE 22