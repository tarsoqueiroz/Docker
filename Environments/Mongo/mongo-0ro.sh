#!/bin/bash
MONGO0ROVOL="/home/tarso/Environments/MongoDB/Mongo-0ro"
echo $MONGO0ROVOL
mkdir -p $MONGO0ROVOL

docker run --name mongo0ro \
           -v     $MONGO0ROVOL:/data/db \
           -p     27017:27017 \
           -p     28017:28017 \
           -d     mongo:3.4
