#!/bin/bash

docker pull ubuntu
docker pull ethereume/client-go
sh buildAndPublish.sh node
sh buildAndPublish.sh geth-dev
sh buildAndPublish.sh geth-node --no-cache
sh buildAndPublish.sh boot-registrar --no-cache
sh buildAndPublish.sh eth-stats-dashboard --no-cache
