#!/bin/bash

GENESIS=/home/geth/genesis.json
DATADIR=/home/geth/.geth
RPCPORT=8545
RPCHOST=0.0.0.0
GETHPORT=30303
GETHARGS=
BOOTNODES=$(curl $BOOTNODE_URL/enodes)

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
GETHARGS="--mine --etherbase $MINER_ADDRESS"
fi

if [ "$BOOTNODES" ]; then
GETHARGS=$GETHARGS --bootnodes $BOOTNODES
fi

if [ ! -d "$DATADIR/chaindata" ]; then
  geth --datadir $DATADIR init $GENESIS
fi

geth --datadir $DATADIR \
        --identity $NODE_NAME \
        --rpc --rpcport $RPCPORT --rpcaddr $RPCHOST \
        --fast \
        --networkid $NETWORKID \
        --port $GETHPORT \
        $GETHARGS

