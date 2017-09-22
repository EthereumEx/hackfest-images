#!/bin/bash

GENESIS=/home/eth-node/genesis.json
DATADIR=/home/eth-node/.geth
RPCPORT=8545
RPCHOST=0.0.0.0
GETHPORT=30303
GETHARGS=
BOOTNODE_URL="$BOOTNODE_URL/staticenodes?network=$BOOTNODE_NETWORK"
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
  if [ -z "$MINER_ADDRESS" ]; then
    echo "No MINER_ADDRESS was supplied"
    exit 1
  fi

  while [ -z "$BOOTNODES" ]
  do	
    BOOTNODES=$(curl --connect-timeout 1 --retry 10  --retry-max-time 10 -f -s $BOOTNODE_URL)
  done

  GETHARGS="--mine --etherbase $MINER_ADDRESS"

  if [ "$MINER_THREADS" ]; then
    GETHARGS="$GETHARGS --minerthreads $MINER_THREADS"
  fi
else
  GETHARGS="--fast"
fi


if [ "$BOOTNODES" ]; then
  echo "Adding bootnodes"
  mkdir -p $DATADIR
  echo $BOOTNODES > $DATADIR/static-nodes.json
fi

if [ ! -d "$DATADIR/chaindata" ]; then
  /geth --datadir $DATADIR init $GENESIS
fi

echo "BOOTNODES"
echo $BOOTNODES
echo $GETHARGS

/geth --datadir $DATADIR \
        --identity $NODE_NAME \
        --nodiscover \
        --rpc --rpcport $RPCPORT --rpcaddr $RPCHOST \
        --networkid $NETWORKID \
        --port $GETHPORT \
        $GETHARGS 2>&1

