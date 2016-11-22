FROM ethereumex/geth-stats

RUN npm install -g pm2
RUN useradd -ms /bin/bash geth
RUN git clone https://github.com/EthereumEx/bootnode-registrar.git /usr/lib/bootnode
WORKDIR /usr/lib/bootnode
RUN git checkout dev/ericmai
RUN npm install

USER geth
WORKDIR /home/geth
ADD app.json /home/geth/app.json
ADD runGeth.sh /home/geth/runGeth.sh

ENTRYPOINT ["pm2", "start", "--no-daemon", "app.json"]


