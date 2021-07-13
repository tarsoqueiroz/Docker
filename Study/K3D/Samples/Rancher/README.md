# Rancher meetup 2020

This tips come from Rancher meetup 2020 - Simplifying your cloud-native development workflow with K3s, K3c and K3d

```
k3d cluster create rancher --api-port 0.0.0.0:6550 --servers 1 --agents 3 --port 40080:80@loadbalancer --port 48080:8080@loadbalancer --volume /Data/Learn/Docker/Study/K3D/Samples/Rancher/volume:/src@all --wait


```