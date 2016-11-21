FROM ethereumex/geth-dev

RUN git clone https://github.com/EthereumEx/eth-net-intelligence-api.git /usr/bin/ethStatsApi
WORKDIR /usr/bin/ethStatsApi
RUN npm install

ENTRYPOINT ["/bin/bash"]

