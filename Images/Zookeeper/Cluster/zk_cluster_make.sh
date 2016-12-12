#!/bin/bash

set -e

mkdir -p zk1/data zk1/datalog
mkdir -p zk2/data zk2/datalog
mkdir -p zk3/data zk3/datalog
mkdir -p zk4/data zk4/datalog
mkdir -p zk5/data zk5/datalog

echo "1" > "zk1/data/myid"
echo "2" > "zk2/data/myid"
echo "3" > "zk3/data/myid"
echo "4" > "zk4/data/myid"
echo "5" > "zk5/data/myid"

docker run --name zkcluster1 -v /Data/Environment/ZooKeeper/zoo1.cfg:/conf/zoo.cfg -v /Data/Environment/ZooKeeper/zk1/data:/data/ -v /Data/Environment/ZooKeeper/zk1/datalog:/datalog/ -p 2181:2181  -p 2888:2888  -p 3888:3888  -d zookeeper:3.4.9
docker run --name zkcluster2 -v /Data/Environment/ZooKeeper/zoo2.cfg:/conf/zoo.cfg -v /Data/Environment/ZooKeeper/zk2/data:/data/ -v /Data/Environment/ZooKeeper/zk2/datalog:/datalog/ -p 12181:2181 -p 12888:2888 -p 13888:3888 -d zookeeper:3.4.9
docker run --name zkcluster3 -v /Data/Environment/ZooKeeper/zoo3.cfg:/conf/zoo.cfg -v /Data/Environment/ZooKeeper/zk3/data:/data/ -v /Data/Environment/ZooKeeper/zk3/datalog:/datalog/ -p 22181:2181 -p 22888:2888 -p 23888:3888 -d zookeeper:3.4.9
docker run --name zkcluster4 -v /Data/Environment/ZooKeeper/zoo4.cfg:/conf/zoo.cfg -v /Data/Environment/ZooKeeper/zk4/data:/data/ -v /Data/Environment/ZooKeeper/zk4/datalog:/datalog/ -p 32181:2181 -p 32888:2888 -p 33888:3888 -d zookeeper:3.4.9
docker run --name zkcluster5 -v /Data/Environment/ZooKeeper/zoo5.cfg:/conf/zoo.cfg -v /Data/Environment/ZooKeeper/zk5/data:/data/ -v /Data/Environment/ZooKeeper/zk5/datalog:/datalog/ -p 42181:2181 -p 42888:2888 -p 43888:3888 -d zookeeper:3.4.9
