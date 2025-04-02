FROM ubuntu:24.10


RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get -y install git

# ssh access
RUN apt-get update && apt-get install -y openssh-server
COPY ./dockerkey.pub /root/.ssh/authorized_keys
EXPOSE 22

# install dotnet 8.0
RUN apt-get install -y dotnet-sdk-8.0

# install nodejs
RUN apt-get install -y nodejs

# workspace
RUN mkdir /workspace
RUN chmod -R 777 /workspace