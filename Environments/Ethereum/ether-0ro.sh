#!/bin/bash
#ETHER0ROVOL="/home/tarso/Environments/Ethereum/Ether-0ro"
ETHER0ROVOL="/Data/Environments/Ethereum/Ether-0ro"
echo $ETHER0ROVOL
mkdir -p $ETHER0ROVOL

docker run -it                                    \
           --name    ethereum                     \
           -v        $ETHER0ROVOL:/root/.ethereum \
           -p        8545:8545                    \
           -p        8546:8546                    \
           -p        28015:28015                  \
           -p        30303:30303                  \
                     ethereum/client-go           \
           --ws                                   \
           --rpc                                  \
           --rpcaddr "0.0.0.0"                    
#           --wsaddr  "0.0.0.0"                    

