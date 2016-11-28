FROM ethereum/client-go:release
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y vim
RUN apt-get install -y net-tools
RUN apt-get -y install npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN apt-get -y install git
RUN apt-get -y install curl
RUN apt-get -y install lsof
RUN npm install -g pm2

ENTRYPOINT ["/bin/bash"]

