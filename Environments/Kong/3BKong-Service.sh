#!/bin/bash
docker run --name 3BKong-Service \
           --link 3BKong-DB:kong-database \
           -e     "KONG_DATABASE=cassandra" \
           -e     "KONG_CASSANDRA_CONTACT_POINTS=3BKong-DB" \
           -p     8000:8000 \
           -p     8443:8443 \
           -p     8001:8001 \
           -p     7946:7946 \
           -p     7946:7946/udp \
           -d     kong:0.9.6
