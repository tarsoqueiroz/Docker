# Cassandra

## Cluster

First cluster node

```
#!/bin/bash
KSDR1NEVOL="$(pwd)/ksdr1ne"
echo $KSDR1NEVOL
mkdir -p $KSDR1NEVOL
docker run --name ksandra1ne \
           -v     $KSDR1NEVOL:/var/lib/cassandra \
           -e     "CASSANDRA_CLUSTER_NAME=ksandra" \
           -e     "CASSANDRA_DC=zocenter" \
           -d     cassandra:3.9
```

Other nodes

```
#!/bin/bash
KSDR2NEVOL="$(pwd)/ksdr2wo"
echo $KSDR2NEVOL
mkdir -p $KSDR2NEVOL
docker run --name ksandra2wo \
           -e     CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' ksandra1ne)" \
           -e     "CASSANDRA_CLUSTER_NAME=ksandra" \
           -e     "CASSANDRA_DC=zocenter" \
           -v     $KSDR2NEVOL:/var/lib/cassandra \
           -d     cassandra:3.9
```

## Test and Status

* Cluster Status
```
docker exec -i -t ksandra1ne sh -c 'nodetool status'
```
* Node IP
```
docker inspect --format='{{ .NetworkSettings.IPAddress }}' ksandra1ne
```
* Connect to CQLSH
```
docker run -it --link ksandra:cassandra --rm cassandra sh -c 'exec cqlsh "$CASSANDRA_PORT_9042_TCP_ADDR"'
```
or
```
docker run -it --link ksandra:ksandrapp --rm cassandra cqlsh cassandra:3.9
```
* Keyspace creation
```
create keyspace demo with replication = {'class':'SimpleStrategy', 'replication_factor':2};
use demo;
```
* Table creation
```
create table names ( id int primary key, name text );
```
* Inserting data
```
insert into names (id,name) values (1, 'gibberish');
```
* Searching for data
```
select * from demo.names;
```



## Source
* [Cassandra on Docker](https://github.com/pokle/cassandra)
* [How to set up Cassandra test cluster using Docker](http://yurisubach.com/2016/03/24/cassandra-docker-test-cluster/)
* [Cassandra's Official Repository on Docker](https://hub.docker.com/_/cassandra/)
* [Running Cassandra Cluster on Docker](https://medium.com/@mertcal/running-cassandra-cluster-on-docker-d9a44aafebb9#.vl76xzd9v0)
* 

