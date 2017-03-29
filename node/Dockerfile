FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
RUN apt-get install -y git
RUN npm install -g grunt
RUN npm install -g pm2

ENTRYPOINT ["/bin/bash"]
