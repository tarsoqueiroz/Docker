#!/bin/bash
docker run --name ZoKong1ne \
           --link kongssandra:kongssandra \
           -e     "KONG_DATABASE=cassandra" \
           -e     "KONG_CASSANDRA_CONTACT_POINTS=kongssandra" \
           -p     10.15.20.117:18000:8000 \
           -p     10.15.20.117:18443:8443 \
           -p     10.15.20.117:18001:8001 \
           -d     kong:0.9.6
