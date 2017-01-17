#!/bin/bash
mkdir -p $PWD/Cassandra
docker run --name 3BKong-DB \
            -v    $PWD/Cassandra:/var/lib/cassandra \
            -p    7000:7000 \
            -p    7001:7001 \
            -p    7199:7199 \
            -p    9160:9160 \
            -p    9042:9042 \
            -d    cassandra:2.2
