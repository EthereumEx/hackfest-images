Usage

sudo docker run -ti -v ~/docker/geth-node/app.json:/home/geth/app.json -v ~/docker/geth-node/genesis.json:/home/geth/genesis.json -v ~/docker/geth-node/runGeth.sh:/home/geth/runGeth.sh -e NETWORKID=1234 -e WS_SERVER=ws://172.17.42.1:4321 -e WS_SECRET=1234 geth-node
