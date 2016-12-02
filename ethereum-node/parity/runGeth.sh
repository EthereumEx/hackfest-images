#!/bin/bash

GENESIS=/home/eth-node/genesis.json
DATADIR=/home/eth-node/.ethdata
RPCPORT=8545
RPCHOST=0.0.0.0
ETHPORT=30303
ETHARGS=
BOOTNODE_URL="$BOOTNODE_URL/paritynodes?network=$BOOTNODE_NETWORK"
BOOTNODES=$(curl --connect-timeout 1 --retry 10  --retry-max-time 10 -f -s $BOOTNODE_URL)
STATSARGS="--ethstats \"$NODE_NAME:$WS_SECRET@$WS_SERVER\""

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
  echo "Mining is not supported on Parity"
  exit 1
fi


if [ "$BOOTNODES" ]; then
  echo "Adding bootnodes"
  echo $BOOTNODES > $DATADIR/static-nodes.json
fi

echo "BOOTNODES"
echo $BOOTNODES
echo $ETHARGS

parity --db-path $DATADIR \
	--chain $GENESIS \
        --identity $NODE_NAME \
        --no-discover \
        --jsonrpc-port $RPCPORT --jsonrpc-interface $RPCHOST \
        --network-id $NETWORKID \
        --port $ETHPORT \
        $ETHARGS 2>&1

