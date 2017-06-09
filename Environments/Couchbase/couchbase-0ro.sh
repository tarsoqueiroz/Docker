#!/bin/bash
COUCHBASE0ROVOL="/home/tarso/Environments/Couchbase/Couchbase-0ro"
echo $COUCHBASE0ROVOL
mkdir -p $COUCHBASE0ROVOL

docker run --name couchbase0ro \
           -v     $COUCHBASE0ROVOL:/opt/couchbase/var \
           -p     8091-8094:8091-8094 \
           -p     11207:11207 \
           -p     11210-11211:11210-11211 \
           -p     18091-18093:18091-18093 \
           -d     couchbase:community-4.5.1
