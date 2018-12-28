#!/bin/bash
MONGO0ROVOL="/home/tarso/Environments/MongoDB/Mongo-0ro.405x"
echo $MONGO0ROVOL

docker run --name mongo0ro.405x.express \
           --link mongo0ro.405x:mongo \
           -p     8081:8081 \
           -d     mongo-express
