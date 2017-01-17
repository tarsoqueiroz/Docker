#!/bin/bash
KSDR3NEVOL="$(pwd)/ksdr3hree"
echo $KSDR3NEVOL
mkdir -p $KSDR3NEVOL
docker run --name ksandra3hree \
           -e     CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' ksandra1ne)" \
           -e     "CASSANDRA_CLUSTER_NAME=ksandra" \
           -e     "CASSANDRA_DC=zocenter" \
           -v     $KSDR3NEVOL:/var/lib/cassandra \
           -d     cassandra:3.9

