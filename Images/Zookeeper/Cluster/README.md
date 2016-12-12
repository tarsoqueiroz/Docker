# Cluster of ZooKeeper on a single machine

... To describe

Docker image of [Apache ZooKeeper](https://zookeeper.apache.org/), an effort to develop and maintain an open-source 
server which enables highly reliable distributed coordination.

This work was inspired on Dockerfile from [zookeeper](https://hub.docker.com/r/libray/zookeeper/).

This work was inspired on tip from [MyJeeva Blog](http://myjeeva.com/zookeeper-cluster-setup.html).

## Run

```
docker run --name ZooKeeper-0_3.4.9 
  -v /..../ZooKeeper/zookeeper0.cfg:/conf/zoo.cfg 
  -v /..../ZooKeeper/data:/data/ 
  -v /..../ZooKeeper/datalog:/datalog/ 
  -p 2181:2181 -p 2888:2888 -p 3888:3888 
  -d tarsoqueiroz/zookeeper-0:v3.4.9
```

## About images

Build different images using different ports for mount a cluster on same machine (experimental pourpouses).

## ToDo

* ...
