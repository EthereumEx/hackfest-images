FROM ethereum/client-go:latest

RUN apk update
RUN apk add bash
RUN apk add curl
RUN mkdir -p /home/eth-node
WORKDIR /home/eth-node
ADD runGeth.sh /home/eth-node/runGeth.sh

ENTRYPOINT ["bash", "runGeth.sh"]


