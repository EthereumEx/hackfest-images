#!/bin/bash

GENESIS=/home/eth-node/genesis.json
DATADIR=/home/eth-node/.ethdata
RPCPORT=8545
RPCHOST=0.0.0.0
ETHPORT=30303
ETHARGS=
BOOTNODE_URL="$BOOTNODE_URL/enodes?network=$BOOTNODE_NETWORK"
BOOTNODES=$(curl --connect-timeout 1 --retry 10  --retry-max-time 10 -f -s $BOOTNODE_URL)

if [ -z "$NETWORKID" ]; then
  echo "No NETWORKID was supplied"
  exit 1
fi

if [ -z "$GENESIS" ]; then
  echo "No GENESIS  was supplied"
  exit 1
fi

if [ -z "$NODE_NAME" ]; then
  echo "No NODE_NAME was supplied"
  exit 1
fi

if [ "$ENABLE_MINER" ]; then
  ETHARGS=" $ETHARGS --mining --address $MINING_ADDRESS --force-mining"
fi


if [ "$BOOTNODES" ]; then
  echo "Adding bootnodes"
  ETHNODES=${BOOTNODES//,/ }
  ETHNODES=${ETHNODES//\//}
  ETHNODES=${ETHNODES//enode/required}
  ETHARGS=" $ETHARGS  --peerset '$ETHNODES'"
fi

echo eth --db-path $DATADIR \
	--config $GENESIS \
        --client-name $NODE_NAME \
	--ipcpath $DATADIR/geth.ipc \
        --json-rpc --json-rpc-port $RPCPORT   \
        --network-id $NETWORKID \
        --listen $ETHPORT \
        --verbosity 9 \
        $ETHARGS > .eth.sh

chmod 0700 ./.eth.sh
./.eth.sh

