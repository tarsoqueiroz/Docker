#!/bin/bash
COUCHDB0ROVOL="/home/tarso/Environments/CouchDB/CouchDB-0ro"
echo $COUCHDB0ROVOL
mkdir -p $COUCHDB0ROVOL

docker run --name couchdb0ro \
           -v     $COUCHDB0ROVOL:/opt/couchdb/data \
           -e     COUCHDB_USER=admin \
           -e     COUCHDB_PASSWORD=changeit \
           -p     5984:5984 \
           -p     4369:4369 \
           -p     9100-9200:9100-9200 \
           -d     couchdb:2.2
