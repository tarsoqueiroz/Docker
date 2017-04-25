#!/bin/bash
RETHINK0ROVOL="/home/tarso/Environments/RethinkDB/Rthink-0ro"
echo $RETHINK0ROVOL
mkdir -p $RETHINK0ROVOL

docker run --name rethink0ro \
           -v     $RETHINK0ROVOL:/data \
           -p     29015:29015 \
           -p     28015:28015 \
           -p     8080:8080 \
           -d     rethinkdb:2.3
