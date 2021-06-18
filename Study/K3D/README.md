# K3D - K3S in Docker

## Commands on test

```
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v4.0.0 bash

k3d --help
k3d version
kubectl cluster-info
kubectl config view

k3d cluster create myfirstcluster
k3d cluster create demo --servers 2 --agents 3
k3d cluster create tqk3s --agents 2 --servers 2  --api-port 0.0.0.0:6666

k3d cluster list
k3d node list

kubectl config use-context k3d-demo

kubectl get nodes,pods -A

k3d cluster delete demo
k3d cluster delete myfirstcluster

cat /etc/hosts


```