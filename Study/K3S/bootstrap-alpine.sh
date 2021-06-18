#!/usr/bin/env bash

# Update & upgrade instalation
apk update
apk upgrade

# Installing Docker
apk add docker docker-compose
rc-update add docker boot
#addgroup vagrant docker
adduser vagrant docker
service docker start

# Installing languages & tools
#apk add go python2 nodejs npm 
apk add git nano

# Improve environment
echo "alias ll='ls -alh'" >> /etc/profile
echo "alias pico='nano'"  >> /etc/profile
