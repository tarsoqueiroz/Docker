#!/bin/bash
COUCHDBVOL="/home/tarso/Environments/CouchDB/CouchDB.alone"
echo $COUCHDBVOL
mkdir -p $COUCHDBVOL

docker run --name couchdb-alone \
           -v     $COUCHDBVOL:/opt/couchdb/data \
           -e     COUCHDB_USER=admin \
           -e     COUCHDB_PASSWORD=changeit \
           -p     5984:5984 \
           -p     4369:4369 \
           -d     couchdb:2.2

#           -p     9100-9200:9100-9200 \
