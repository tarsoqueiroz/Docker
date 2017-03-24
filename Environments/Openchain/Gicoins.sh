#!/bin/bash
docker run --name Gicoins \
           -v     /home/tarso/Environments/Openchain/data:/openchain/data \
           -p     8080:8080 \
           -d     tarsoqueiroz/tq-openchain:0.7.0
