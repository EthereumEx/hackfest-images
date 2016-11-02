#!/bin/bash

GENESIS=/home/geth/genesis.json
DATADIR=/home/geth/.geth
RPCPORT=8545
RPCHOST=0.0.0.0
RPCAPI=all
GETHPORT=30303

if [ -z "$NETWORKID" ]; then
  echo "No NETWORKID was supplied"
  exit 1
fi

if [ -z "$GENESIS" ]; then
  echo "No GENESIS  was supplied"
  exit 1
fi

if [ ! -d "$DATADIR/chaindata" ]; then
  geth --datadir $DATADIR init $GENESIS
fi

geth --datadir $DATADIR \
        --rpc --rpcport $RPCPORT --rpcaddr $RPCHOST \
        --fast \
        --networkid $NETWORKID \
        --port $GETHPORT

