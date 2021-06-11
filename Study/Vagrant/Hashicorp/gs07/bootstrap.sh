#!/usr/bin/env bash

# Update & upgrade instalation
apk update
apk upgrade
# Installing Docker
apk add docker docker-compose
addgroup vagrant docker
rc-update add docker default
# Installing languages & tools
apk add go python2 nodejs npm 
apk add git nano


# if ! [ -L /var/www ]; then
#   rm -rf /var/www
#   ln -fs /vagrant /var/www
# fi

