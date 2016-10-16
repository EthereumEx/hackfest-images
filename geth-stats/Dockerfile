FROM geth-dev

RUN useradd -ms /bin/bash geth
RUN npm install -g forever
RUN npm install -g pm2

USER geth
WORKDIR /home/geth
RUN git clone https://github.com/EthereumEx/eth-net-intelligence-api.git apiWorker
WORKDIR /home/geth/apiWorker
COPY ./app.json ./app.json
RUN npm install

ENTRYPOINT ["/bin/bash"]

