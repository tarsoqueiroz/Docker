#!/bin/bash
ETHER0ROVOL="/home/tarso/Environments/Ethereum/Ether-0ro"
echo $ETHER0ROVOL
mkdir -p $ETHER0ROVOL

docker run --name    ether0ro                     \
           -v        $ETHER0ROVOL:/root/.ethereum \
           -p        30303:30303                  \
           -p        28015:28015                  \
           -p        8545:8545                    \
           --rpc                                  \
           --rpcaddr "0.0.0.0"                    \
           -d        ethereum/client-go


docker run -it 
           --name    ethereum 
           -v        /home/tarso/Environments/Ethereum/Ethereum:/root/.ethereum
           -p        30303:30303 
           -p        8545:8545
           -p        8546:8546 
           ethereum/client-go
           --ws      
           --rpc 
           --rpcaddr "0.0.0.0" 
           --wsaddr  "0.0.0.0"


docker run --name ether0ro -v $ETHER0ROVOL:/root/.ethereum -p 30303:30303 -p 28015:28015 -p 8545:8545 --rpc --rpcaddr "0.0.0.0" -d ethereum/client-go -it

docker run -it --name ethereum -v /home/tarso/Environments/Ethereum/Ethereum:/root/.ethereum -p 30303:30303 -p 8545:8545 -p 8546:8546 ethereum/client-go --ws --rpc --rpcaddr "0.0.0.0" --wsaddr "0.0.0.0"
