#!/bin/bash
MYSQL0ROVOL="/home/tarso/Environments/MySQL/MySQL-0ro"
echo $MYSQL0ROVOL
mkdir -p $MYSQL0ROVOL

docker run --name mysql0ro \
           -v     $MYSQL0ROVOL:/var/lib/mysql \
           -e     MYSQL_ROOT_PASSWORD=changeit \
           -p     3306:3306 \
           -d     mysql:5.7
