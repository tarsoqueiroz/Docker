#!/bin/bash
COUCHDB2WOVOL="/home/tarso/Environments/CouchDB/CouchDB-2wo"
echo $COUCHDB2WOVOL
mkdir -p $COUCHDB2WOVOL

docker run --name couchdb2wo \
           -v     $COUCHDB2WOVOL:/opt/couchdb/data \
           -e     COUCHDB_USER=admin \
           -e     COUCHDB_PASSWORD=changeit \
           -p     25984:5984 \
           -p     24369:4369 \
           -p     29100-29200:9100-9200 \
           -d     couchdb:2.2
