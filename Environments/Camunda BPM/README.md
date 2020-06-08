# Docker Environment for Camunda BPM

References:

- [Tutorial de Workflow/BPM com Node.js (Camunda)](https://www.luiztools.com.br/post/tutorial-de-workflow-bpm-com-node-js-camunda/)
- [Camunda BPM Docker image](https://hub.docker.com/r/camunda/camunda-bpm-platform)

## Create machines

Create the following machines:

- CamundaBPM00: Camunda BPM engine (multipass)
- CamundaBPM01: Node.JS workers (multipass)

```
multipass launch --cpus 1 --mem 2G --name camundabpm00 18.04
multipass launch --cpus 1 --mem 2G --name camundabpm01 18.04
```

### IP for each machine

```
multipass ls
```

### Connect to shell ...

```
multipass shell { camundabpm00 | camundabpm00 }
```

## Installing Camunda BPM on camundabpm00

Execute at root

```
apt install docker.io
docker pull camunda/camunda-bpm-platform:latest
docker run -d --name camunda -p 8080:8080 camunda/camunda-bpm-platform:latest
```

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


