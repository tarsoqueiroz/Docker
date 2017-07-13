#!/bin/bash
REDIS0ROVOL="/home/tarso/Environments/Redis/Rthink-0ro"
echo $REDIS0ROVOL
mkdir -p $REDIS0ROVOL

docker run --name redis0ro \
           -v     $REDIS0ROVOL:/data \
           -p     6379:6379 \
           -d     redis:3.2-alpine \
                  redis-server --appendonly yes


