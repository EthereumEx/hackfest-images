FROM ethereum/client-cpp

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

RUN useradd -ms /bin/bash eth-node

USER eth-node
WORKDIR /home/eth-node

RUN pm2 install pm2-logrotate
RUN pm2 set pm2-logrotate:max_size 100M
RUN pm2 set pm2-logrotate:compress true
RUN pm2 set pm2-logrotate:rotateInterval '23 * * *'

RUN git clone https://github.com/EthereumEx/bootnode-registrar.git /home/eth-node/lib/bootnode
WORKDIR /home/eth-node/lib/bootnode
RUN npm install

RUN git clone https://github.com/EthereumEx/eth-net-intelligence-api.git /home/eth-node/lib/ethStatsApi
WORKDIR /home/eth-node/lib/ethStatsApi
RUN npm install


ENTRYPOINT ["/bin/bash"]
