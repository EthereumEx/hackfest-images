FROM ethereum/client-go
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y vim
RUN apt-get install -y net-tools
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
# RUN apt-get -y install npm
# RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN ln -s /geth /usr/bin/geth
RUN apt-get -y install git
RUN apt-get -y install lsof
RUN npm install -g pm2

ENTRYPOINT ["/bin/bash"]

