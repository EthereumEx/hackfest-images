FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y npm nodejs-legacy

RUN npm install -g  grunt
RUN npm install -g pm2



RUN apt-get install -y git
RUN useradd -ms /bin/bash dashboard
USER dashboard

WORKDIR /home/dashboard
RUN git clone https://github.com/EthereumEx/eth-netstats.git eth-stats
RUN git clone https://github.com/EthereumEx/bootnode-registrar.git bootnode

WORKDIR /home/dashboard/eth-stats
RUN npm install
RUN grunt all

WORKDIR /home/dashboard/bootnode
RUN git checkout dev/ericmai
RUN npm install

WORKDIR /home/dashboard
ADD app.json /home/dashboard/app.json
ADD run.sh /home/dashboard/run.sh

ENTRYPOINT ["sh", "run.sh"]
