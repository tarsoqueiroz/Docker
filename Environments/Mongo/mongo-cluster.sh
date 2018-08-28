#!/bin/bash
MONGOCLUSTER0VOL="/home/tarso/Environments/MongoDB/Mongo-Cluster-0"
echo $MONGOCLUSTER0VOL
mkdir -p $MONGOCLUSTER0VOL

docker run --name mongocluster-0 \
           -v     $MONGOCLUSTER0VOL:/data/db \
           -p      7017:27017 \
           -p      7018:27018 \
           -p      7019:27019 \
           -d     mongo:4.0

MONGOCLUSTER1VOL="/home/tarso/Environments/MongoDB/Mongo-Cluster-1"
echo $MONGOCLUSTER1VOL
mkdir -p $MONGOCLUSTER1VOL

docker run --name mongocluster-1 \
           -v     $MONGOCLUSTER1VOL:/data/db \
           -p     17017:27017 \
           -p     17018:27018 \
           -p     17019:27019 \
           -d     mongo:4.0

MONGOCLUSTER2VOL="/home/tarso/Environments/MongoDB/Mongo-Cluster-2"
echo $MONGOCLUSTER2VOL
mkdir -p $MONGOCLUSTER2VOL

docker run --name mongocluster-2 \
           -v     $MONGOCLUSTER2VOL:/data/db \
           -p     27017:27017 \
           -p     27018:27018 \
           -p     27019:27019 \
           -d     mongo:4.0

