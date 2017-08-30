#!/bin/bash
ETHER0ROVOL="/home/tarso/Environments/Ethereum/Ether-0ro"
echo $ETHER0ROVOL
mkdir -p $ETHER0ROVOL

docker run -it       \
           --name    ether0ro \
           -v        $ETHER0ROVOL:/root/.ethereum \
           -p        30303:30303 \
           -p        28015:28015 \
           -p        8545:8545 \
                     ethereum/client-go \
                     console
