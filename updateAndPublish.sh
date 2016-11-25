#!/bin/bash

docker pull ubuntu
docker pull ethereume/client-go
sh buildAndPublish.sh geth-dev
sh buildAndPublish.sh geth-stats
sh buildAndPublish.sh geth-node
sh buildAndPublish.sh boot-registrar
sh buildAndPublish.sh eth-stats-dashboard
