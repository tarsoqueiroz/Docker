# HAProxy

## Nodes

Dockerized Node.js web app was used for nodes to be balanced.

### Starting nodes

* Node 1

```
docker run --name ZoWebApp01 \
           -p 10.15.20.117:8081:8080 \
           -e "HTTPD_SNAME=ZoWebApp01" \
           -e "HTTPD_PORT=8080" \
           -d tarsoqueiroz/node-web-app
```

* Node 2

```
docker run --name ZoWebApp02 \
           -p 10.15.20.117:8082:8080 \
           -e "HTTPD_SNAME=ZoWebApp02" \
           -e "HTTPD_PORT=8080" \
           -d tarsoqueiroz/node-web-app
```

## Load Balance

HAProxy was used for this mission.

### Starting LB

```
docker run --name ZoLB \
           -p 10.15.20.117:8080:80 \
           --link ZoWebApp01:ZoWebApp01 \
           --link ZoWebApp02:ZoWebApp02 \
           -d tutum/haproxy
```


## Source
* [Docker PUBLIC REPOSITORY - tutum/haproxy](https://hub.docker.com/r/tutum/haproxy/)
* [Load Balancing – The Missing Piece of the Container World](https://blog.tutum.co/2015/05/05/load-balancing-the-missing-piece-of-the-container-world/)
* [Dockerizing a Node.js web app](https://github.com/tarsoqueiroz/NodeJS/tree/master/Misc/Dockerizing)
* []()
