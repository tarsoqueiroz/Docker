#!/bin/bash
KSDR1NEVOL="$(pwd)/ZoKsdr1ne"
echo $KSDR1NEVOL
mkdir -p $KSDR1NEVOL
docker run --name ZoKsdr1ne \
           -v     $KSDR1NEVOL:/var/lib/cassandra \
           -d     cassandra:3.9
