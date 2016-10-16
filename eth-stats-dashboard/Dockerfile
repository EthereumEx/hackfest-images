FROM node

RUN useradd -ms /bin/bash dashboard
USER dashboard
WORKDIR /home/dashboard
RUN git clone https://github.com/EthereumEx/eth-netstats.git eth-stats
WORKDIR /home/dashboard/eth-stats
RUN npm install

ENTRYPOINT ["npm", "start"]
