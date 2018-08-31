#!/bin/bash
COUCHDB1NEVOL="/home/tarso/Environments/CouchDB/CouchDB-1ne"
echo $COUCHDB1NEVOL
mkdir -p $COUCHDB1NEVOL

docker run --name couchdb1ne \
           -v     $COUCHDB1NEVOL:/opt/couchdb/data \
           -e     COUCHDB_USER=admin \
           -e     COUCHDB_PASSWORD=changeit \
           -p     15984:5984 \
           -p     14369:4369 \
           -p     19100-19200:9100-9200 \
           -d     couchdb:2.2
