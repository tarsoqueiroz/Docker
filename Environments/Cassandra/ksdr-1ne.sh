#!/bin/bash
KSDR1NEVOL="$(pwd)/ksdr1ne"
echo $KSDR1NEVOL
mkdir -p $KSDR1NEVOL
docker run --name ksandra1ne \
           -v     $KSDR1NEVOL:/var/lib/cassandra \
           -e     "CASSANDRA_CLUSTER_NAME=ksandra" \
           -e     "CASSANDRA_DC=zocenter" \
           -d     cassandra:3.9

