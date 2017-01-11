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
* Removing node

```
root@station# docker exec -i -t ksandra1ne sh -c 'nodetool status'

Datacenter: datacenter1
=======================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address      Load       Tokens       Owns (effective)  Host ID                               Rack
UN  172.17.0.7   303.53 KiB  256          49.5%             3033029e-9606-416e-ae37-dde7d7b64471  rack1
UN  172.17.0.8   113.57 KiB  256          49.6%             39025018-4df7-46be-952b-316e7187b87a  rack1
DN  172.17.0.27  ?          256          51.2%             2a161194-5315-423c-ba39-74c9b9d4d468  rack1
DN  172.17.0.28  ?          256          49.7%             dcb5d6a2-5861-4cd1-882e-bc38192184b2  rack1

root@station# docker exec -i -t ksandra1ne sh -c 'nodetool removenode 2a161194-5315-423c-ba39-74c9b9d4d468'

Datacenter: datacenter1
=======================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address      Load       Tokens       Owns (effective)  Host ID                               Rack
UN  172.17.0.7   308.28 KiB  256          49.5%             3033029e-9606-416e-ae37-dde7d7b64471  rack1
UN  172.17.0.8   123.69 KiB  256          49.6%             39025018-4df7-46be-952b-316e7187b87a  rack1
DL  172.17.0.27  ?          256          51.2%             2a161194-5315-423c-ba39-74c9b9d4d468  rack1
DN  172.17.0.28  ?          256          49.7%             dcb5d6a2-5861-4cd1-882e-bc38192184b2  rack1

root@station# docker exec -i -t ksandra1ne sh -c 'nodetool removenode force'RemovalStatus: Removing token (-9218062038368652755). Waiting for replication confirmation from [/172.17.0.8].

root@station# docker exec -i -t ksandra1ne sh -c 'nodetool status'

Datacenter: datacenter1
=======================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address      Load       Tokens       Owns (effective)  Host ID                               Rack
UN  172.17.0.7   303.42 KiB  256          64.9%             3033029e-9606-416e-ae37-dde7d7b64471  rack1
UN  172.17.0.8   123.69 KiB  256          67.3%             39025018-4df7-46be-952b-316e7187b87a  rack1
DN  172.17.0.28  ?          256          67.8%             dcb5d6a2-5861-4cd1-882e-bc38192184b2  rack1
```
## Using Cassandra
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

