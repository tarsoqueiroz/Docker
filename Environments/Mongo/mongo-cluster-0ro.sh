#!/bin/bash
MONGOCLUSTER0ROVOL="/home/tarso/Environments/MongoDB/Mongo-Cluster-0ro"
echo $MONGOCLUSTER0ROVOL
mkdir -p $MONGOCLUSTER0ROVOL

docker run --name mongocluster0ro \
           -v     $MONGOCLUSTER0ROVOL:/data/db \
           -p     27017:27017 \
           -p     28017:28017 \
           -d     mongo:4.0
