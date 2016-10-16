FROM node

RUN npm install -g  grunt

RUN useradd -ms /bin/bash dashboard
USER dashboard
WORKDIR /home/dashboard
RUN git clone https://github.com/EthereumEx/eth-netstats.git eth-stats
WORKDIR /home/dashboard/eth-stats
RUN npm install
RUN grunt all

ENTRYPOINT ["npm", "start"]
