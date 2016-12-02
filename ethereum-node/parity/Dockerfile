FROM ethcore/parity:stable-release

RUN useradd -ms /bin/bash geth
RUN ln -s /build/parity/target/release/parity /usr/bin/parity
#USER geth
#WORKDIR /home/geth
#RUN pm2 install pm2-logrotate
#RUN pm2 set pm2-logrotate:max_size 100M
#RUN pm2 set pm2-logrotate:compress true
#RUN pm2 set pm2-logrotate:rotateInterval '23 * * *'

#RUN git clone https://github.com/EthereumEx/bootnode-registrar.git /home/geth/lib/bootnode
#WORKDIR /home/geth/lib/bootnode
#RUN npm install

#RUN git clone https://github.com/EthereumEx/eth-net-intelligence-api.git /home/geth/lib/ethStatsApi
#WORKDIR /home/geth/lib/ethStatsApi
#RUN npm install

#WORKDIR /home/geth
#ADD app.json /home/geth/app.json
#ADD runGeth.sh /home/geth/runGeth.sh

#ENTRYPOINT ["pm2", "start", "--no-daemon", "app.json"]
ENTRYPOINT ["/bin/bash"]


