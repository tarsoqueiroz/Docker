#!/bin/bash
KSDR2NEVOL="$(pwd)/ksdr2wo"
echo $KSDR2NEVOL
mkdir -p $KSDR2NEVOL
docker run --name ksandra2wo \
           -e     CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' ksandra1ne)" \
           -e     "CASSANDRA_CLUSTER_NAME=ksandra" \
           -e     "CASSANDRA_DC=zocenter" \
           -v     $KSDR2NEVOL:/var/lib/cassandra \
           -d     cassandra:3.9

