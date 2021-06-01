# OReilly Kubernetes and Docker

## Commands

### General use

docker ps
docker ps -a
docker images

### Images

docker build -t img_from .
docker build -t run_env .

### Execution

docker run -itd --name cont_run-env run_env
docker exec -it cont_run-env bash
docker build -f parent-Dockerfile -t papa-ubuntu .
docker images
docker build -f child-Dockerfile -t baby-ubuntu .
docker images
docker run -itd --name baby-container baby-ubuntu
docker ps -a
docker exec -it baby-container bash

### Network

docker network create --driver bridge my-bridge
docker network create --driver bridge --subnet=192.168.0.0/16 --ip-range=192.168.5.0/24  my-bridge-1
docker network ls
docker network connect {network-name} {container-name}

### Storage

docker volume create {volume-name}
docker run -d --volume {volume-name}:{path on container} {container-name}

### Container's samples

2048 game from [github of Cerulean](https://github.com/cerulean-canvas/2048)

docker run -itd --name 2048 \
       --mount type=bind,source="${pwd}"/,target=/usr/share/nginx/html \
       -p 8080:80 \
       nginx:latest

### Docker-machine

docker-machine create --driver virtualbox manager
docker-machine ls
docker-machine create --driver virtualbox worker-1
docker-machine create --driver virtualbox worker-2
docker-machine stop manager
docker-machine start manager
docker-machine inspect manager
docker-machine ssh manager

### Docker Swarm

docker swarm init --advertise-addr 192.168.99.100
docker swarm join-token worker
docker swarm join --token {token} 192.168.99.100:2377
docker node ls
docker node inspect --pretty self

No PRINCIPAL
docker service create --name web-server -p 8080:80 --replicas 3 nginx:latest
docker service ls
docker service ps web-server
docker service inspect web-server
docker ps -a

docker node update --availabilit drain worker-2

Em um SECUNDARIO
docker swarm leave

No PRINCIPAL
docker node rm worker-2
docker@manager:~$ docker node ls
