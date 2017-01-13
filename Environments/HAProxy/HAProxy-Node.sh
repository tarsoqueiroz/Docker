#!/bin/bash
docker run --name HAProxy-Node \
            -v    /home/tarso/Environments/HAProxy/haproxy-node.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro \
            -p    10.15.20.117:8080:8080 \
            -p    10.15.20.117:1936:1936 \
            -d    haproxy:1.7.1-alpine

