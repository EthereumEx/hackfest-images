FROM node

RUN git clone https://github.com/EthereumEx/bootnode-registrar.git /usr/bin/nodeRegistrar
WORKDIR /usr/bin/nodeRegistrar
RUN git checkout dev/ericmai
RUN npm install
RUN useradd -ms /bin/bash nodeUser
USER nodeUser

ENTRYPOINT ["node", "app.js"]


