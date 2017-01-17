#!/bin/bash
docker run --name ksdr-1ne \
           --link 3BKong-DB:kong-database \
           -e     "KONG_DATABASE=cassandra" \
           -e     "KONG_CASSANDRA_CONTACT_POINTS=3BKong-DB" \
           -p     8000:8000 \
           -p     8443:8443 \
           -p     8001:8001 \
           -p     7946:7946 \
           -p     7946:7946/udp \
           -d     kong



docker run --name some-cassandra -v /my/own/datadir:/var/lib/cassandra -d cassandra:tag

#!/bin/bash
KSDR-1NE_VOL="$(pwd)/ksdr-1ne"
mkdir -p KSDR-1NE_VOL
docker run --name ksdr-1ne \
           -e     "CASSANDRA_CLUSTER_NAME=ksandracluster" \
           -e     "CASSANDRA_DC=ksandracenter" \
           -e     "CASSANDRA_RACK=rksandra" \
           -v     KSDR-1NE_VOL:/var/lib/cassandra 
           -p     8000:8000 \
           -p     8443:8443 \
           -p     8001:8001 \
           -p     7946:7946 \
           -p     7946:7946/udp \
           -d     cassandra:3.9
