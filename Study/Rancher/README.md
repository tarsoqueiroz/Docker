# Intro to Rancher and Kubernetes Online Training

References:

- [Intro to k3s: Lightweight Kubernetes](https://www.youtube.com/watch?v=2LNxGVS81mE)
- [May 28, 2020: Intro to Rancher and Kubernetes Online Training](https://www.youtube.com/watch?v=c-JFx_dQyck) - current in 22min
- [Training Guide (moved)](https://github.com/rancher/k8s-intro-training)
- [Slack Rancher](https://slack.rancher.io)

## Create machines

Create the following machines:

- rancher0: Rancher Master 00 (multipass)
- k3smst00: K3s Master 00 (multipass)
- k3swrk00: K3s Worker 00 (multipass)
- k3swrk01: K3s Worker 01 (multipass)

```
multipass launch --cpus 1 --mem 2G --name rancher0 18.04
multipass launch --cpus 1 --mem 2G --name k3smst00 18.04
multipass launch --cpus 1 --mem 2G --name k3swrk00 18.04
multipass launch --cpus 1 --mem 2G --name k3swrk01 18.04
```

### IP for each machine

```
multipass ls
```

### Connect to shell ...

```
multipass shell { k3smst00 | k3swrk00 | k3swrk01 }
```

## Installing K3s cluster

Execute as root

### At master

Install K3s

```
curl -sfL https://get.k3s.io | sh -
```

Get TOKEN

```
cat /var/lib/rancher/k3s/server/node-token
```

Get IP



### Connecting to Camunda BPM with browser

```
http://<IP camundabpm00>:8080/camunda-welcome/index.html
```

## Install Node.JS on CamundaBPM01 machine

### Install NVM

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

### Install Node.JS and verify version of Node and NPM

```
nvm install node
node --version
npm --version
```


