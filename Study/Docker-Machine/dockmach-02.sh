#!/usr/bin/env bash
# https://www.macadamian.com/learn/docker-machine-basic-examples/
set -e
MACHINE_NAME="dockmach02"
docker-machine create --driver virtualbox ${MACHINE_NAME}