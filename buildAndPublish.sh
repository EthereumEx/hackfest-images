#!/bin/bash

ORG=ethereumex
docker build -t $ORG/$1 $2 $1/.
docker push $ORG/$1
