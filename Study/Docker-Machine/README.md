# Docker Machine Study

## Network for machines

``docker network create docknet01``

``docker network create --driver=bridge --subnet=10.15.20.0/24 --gateway=10.15.20.1 docknet02``


## Create machine

``docker-machine create --driver virtualbox --virtualbox-disk-size "2048" --virtualbox-memory "1024" dockmach01``

## Connect to shell

``docker-machine ssh dockmach01``