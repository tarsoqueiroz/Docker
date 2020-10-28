#!/usr/bin/env bash
# https://multipass.run/docs
set -e
# Parms
MACHINE_NAME="tqdbs"
MACHINE_CPU_COUNT="2"
MACHINE_DISK_SIZE="10G"
MACHINE_MEMORY_SIZE="2G"
# Launch
multipass launch  -vvv \
                  --cpus  ${MACHINE_CPU_COUNT} \
                  --disk  ${MACHINE_DISK_SIZE} \
                  --mem   ${MACHINE_MEMORY_SIZE} \
                  --name  ${MACHINE_NAME} \
                  20.04
