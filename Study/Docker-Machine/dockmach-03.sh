#!/usr/bin/env bash
# https://www.macadamian.com/learn/docker-machine-basic-examples/
set -e
MACHINE_NAME="dockmach03"
MACHINE_CPU_COUNT="2"
MACHINE_DISK_SIZE="30720"
MACHINE_MEMORY_SIZE="2048"
docker-machine create --driver virtualbox \
                      --virtualbox-memory ${MACHINE_MEMORY_SIZE} \
                      --virtualbox-cpu-count ${MACHINE_CPU_COUNT} \
                      --virtualbox-disk-size ${MACHINE_DISK_SIZE} \
                      ${MACHINE_NAME}