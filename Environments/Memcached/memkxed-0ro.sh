#!/bin/bash
# MEMCACHED0ROVOL="/home/tarso/Environments/MemcachedDB/Memkxd-0ro"
# echo $MEMCACHED0ROVOL
# mkdir -p $MEMCACHED0ROVOL

docker run --name memkxd0ro \
           -p     11211:11211 \
           -d     memcached:1.5-alpine

#          -v     $MEMCACHED0ROVOL:/data \
