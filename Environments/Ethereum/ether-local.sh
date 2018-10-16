#!/bin/bash

# Create the root path of Ethereum
ETHERPATH="/home/tarso/Environments/Ethereum/BlkxenPR"
#ETHERPATH="/Data/Environments/Ethereum/Ether-0ro"
echo $ETHERPATH
mkdir -p $ETHERPATH

# Create a folder for store bootnode’s data
mkdir -p $ETHERPATH/bootnode

# Create the boot.key
docker run --rm \
           -v     $ETHERPATH/bootnode:/opt/bootnode \
                  ethereum/client-go:alltools-stable bootnode --genkey /opt/bootnode/boot.key

# Start the bootnode
docker run -d \
           --name bootnode \
           -v     $ETHERPATH/bootnode:/opt/bootnode \
           -p     30301:30301 \
                  ethereum/client-go:alltools-stable bootnode --nodekey /opt/bootnode/boot.key

# Genesis block on 'genesis.json'

# Create the first node
# Create the genesis block
mkdir -p $ETHERPATH/node1
docker run --rm \
           -v     /home/tarso/Environments/Ethereum/BlkxenPR/node1:/root \
           -v     /home/tarso/Environments/Ethereum/BlkxenPR/genesis.json:/opt/genesis.json \
                  ethereum/client-go:stable init /opt/genesis.json

# Start first Ethereum blockchain node

# Get enode
docker logs bootnode

# Get IP
docker exec bootnode ifconfig eth0

# Finally, start first node
docker run -d \
           --name node1 \
           -v     /home/tarso/Environments/Ethereum/BlkxenPR/node1:/root \
           -p     30303:30303 \
           -p     8545:8545 \
                  ethereum/client-go:stable \
                    --bootnodes=enode://47fc38d952b5a70047b75facb5acb19406139862ac05e62d2110c5b4ccfa1cc7d6172325922002c85ffc2a0fb7b338f1c0f76c01d98ac3ac3c0f35196403b99b@172.17.0.2:30301 \
                    --networkid 1561 \
                    --rpc \
                    --rpcapi=db,eth,net,web3,personal \
                    --rpcaddr=0.0.0.0 \
                    --rpccorsdomain "*"

# Create the second node
# Create the genesis block
mkdir -p /home/tarso/Environments/Ethereum/BlkxenPR/node2
docker run --rm \
           -v     /home/tarso/Environments/Ethereum/BlkxenPR/node2:/root \
           -v     /home/tarso/Environments/Ethereum/BlkxenPR/genesis.json:/opt/genesis.json \
                  ethereum/client-go:stable init /opt/genesis.json

# Start second node
docker run -d \
           --name node2 \
           -v     /home/tarso/Environments/Ethereum/BlkxenPR/node2:/root \
           -p     30305:30303 \
           -p     8547:8545 \
                  ethereum/client-go:stable \
                    --bootnodes=enode://47fc38d952b5a70047b75facb5acb19406139862ac05e62d2110c5b4ccfa1cc7d6172325922002c85ffc2a0fb7b338f1c0f76c01d98ac3ac3c0f35196403b99b@172.17.0.2:30301 \
                    --networkid 1561 \
                    --rpc \
                    --rpcapi=db,eth,net,web3,personal \
                    --rpcaddr=0.0.0.0 \
                    --rpccorsdomain "*"







#docker run -it                                    \
#           --name    ethereum                     \
#           -v        $ETHERPATH:/root/.ethereum \
#           -p        8545:8545                    \
#           -p        8546:8546                    \
#           -p        28015:28015                  \
#           -p        30303:30303                  \
#                     ethereum/client-go           \
#           --ws                                   \
#           --rpc                                  \
#           --rpcaddr "0.0.0.0"                    

