#!/bin/bash
KSDR0ROVOL="$(pwd)/ZoKsdr0ro"
echo $KSDR0ROVOL
mkdir -p $KSDR0ROVOL

docker run --name ksandra0ro \
           -v     $KSDR0ROVOL:/var/lib/cassandra \
           -p     7000:7000 \
           -p     7001:7001 \
           -p     7199:7199 \
           -p     7946:7946/udp \
           -p     8000:8000 \
           -p     8001:8001 \
           -p     8443:8443 \
           -p     9042:9042 \
           -p     9160:9160 \
           -d     cassandra:3.9
