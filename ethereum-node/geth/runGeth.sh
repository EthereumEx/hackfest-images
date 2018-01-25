#!/bin/bash

GENESIS=/home/eth-node/genesis.json
TMPDIR=/home/eth-node/.tmp
DATADIR=/home/eth-node/.geth
RPCPORT=8545
RPCHOST=0.0.0.0
GETHPORT=30303
GETHARGS=$EXTERNAL_ARGS
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

if [ "${NETWORKID}" == "1" ]; then
    echo "Using Main Net"
elif [ "${NETWORKID}" == "3" ]; then
    GETHARGS="${GETHARGS} --testnet"
elif [ "${NETWORKID}" == "4" ]; then
    GETHARGS="${GETHARGS} --rinkeby"
else
  if [ ! -d "$DATADIR/chaindata" ]; then
    geth --datadir $DATADIR init $GENESIS
  fi
    GETHARGS="${GETHARGS} --nodiscover --networkid $NETWORKID"

  if [ "$SEALER_KEY" ]; then
    if [ ! -d "$DATADIR/keystore" ]; then
      rm -fr $DATADIR/keystore
    fi

    mkdir -p $TMPDIR
    KEY_FILE="$TMPDIR/private.key"
    PW_FILE="$TMPDIR/private.pwd"
    echo "Initialize sealer"
    echo $SEALER_KEY>$KEY_FILE

    if [ ! -e $PW_FILE ]; then
      echo $SEALER_PW>$PW_FILE
      chmod 0600 $PW_FILE
    fi

    MINER_ADDRESS=$(geth --datadir $DATADIR --password $PW_FILE account import $KEY_FILE | cut -c 11-50)
    ENABLE_MINER=1
    rm $KEY_FILE
    GETHARGS="${GETHARGS} --unlock "0" --password ${PW_FILE}"
  fi
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

  GETHARGS="$GETHARGS --mine --etherbase $MINER_ADDRESS"

  if [ "$MINER_THREADS" ]; then
    GETHARGS="$GETHARGS --minerthreads $MINER_THREADS"
  fi
else
  GETHARGS="$GETHARGS --fast"
fi

if [ "$BOOTNODES" ]; then
  echo "Adding bootnodes"
  mkdir -p $DATADIR
  echo $BOOTNODES > $DATADIR/static-nodes.json
fi

echo geth --datadir $DATADIR \
        --identity $NODE_NAME \
        --rpc --rpcport $RPCPORT --rpcaddr $RPCHOST \
        --port $GETHPORT \
        $GETHARGS

geth --datadir $DATADIR \
        --identity $NODE_NAME \
        --rpc --rpcport $RPCPORT --rpcaddr $RPCHOST \
        --port $GETHPORT \
        $GETHARGS 2>&1
