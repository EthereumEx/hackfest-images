#!/bin/bash

ORG=ethereumex
docker build -t $ORG/$1 $1/.
docker push $ORG/$1
