# MosQuiTTo (MQTT)

First and experimental Docker image of [Mosquitto](https://mosquitto.org/), an Open Source MQTT v3.1/v3.1.1 Broker, under [Alpine Linux](https://hub.docker.com/_/alpine/).  
Inspired on Dockerfile from [toke/mosquitto](https://hub.docker.com/r/toke/mosquitto/) and [ansi/mosquitto](https://hub.docker.com/r/ansi/mosquitto/).

## Run

```
docker run -ti -p 1883:1883 -p 8883:8883 -p 9001:9001 \
       -v /...../Mosquitto/config:/etc/mosquitto:ro \
       -v /...../Mosquitto/log:/var/log/mosquitto \
       -v /...../Mosquitto/data/:/var/lib/mosquitto/ \
       --name MosQuiTTo_1.4.8 \
       -d tarsoqueiroz/mosquitto:1.4.8
```

## ToDo

* Certificates
