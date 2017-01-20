#!/bin/bash
KSDR2NEVOL="$(pwd)/ZoKsdr2wo"
echo $KSDR2NEVOL
mkdir -p $KSDR2NEVOL
docker run --name ZoKsdr2wo \
           -v     $KSDR2NEVOL:/var/lib/cassandra \
           -e     CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' ZoKsdr1ne)" \
           -d     cassandra:3.9
