#!/bin/sh

# Update & upgrade instalation
sudo apt update
sudo apt upgrade -y

# Installing Tools
# Installing Git
sudo apt install git -y
# Installing Git
sudo apt install curl -y
# Installing tools
sudo apt install apt-transport-https ca-certificates gnupg-agent software-properties-common -y
# Installing Docker
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo apt-key fingerprint 0EBFCD88
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#sudo apt update
#sudo apt install docker-ce docker-ce-cli containerd.io docker-compose -y
#sudo usermod -aG docker $USER
#newgrp docker

# Installing Golang
#curl -o "go.tar.gz" https://storage.googleapis.com/golang/go1.15.linux-amd64.tar.gz
#sudo chmod +x go.tar.gz
#sudo tar -C /usr/local -xzf "go.tar.gz"

# Installing node
#curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
#sudo apt install nodejs -y

# Install zsh
#sudo apt install zsh -y
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Adjusting environment
#echo "export PATH=$PATH:/usr/local/go/bin" >> "$HOME/.bashrc"
#echo "zsh" >> "$HOME/.bashrc"

# Hyperledger Fabric samples, binaries and Docker images
#mkdir -p /home/vagrant/Hyperledger
#cd /home/vagrant/Hyperledger
#curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.2.3 1.5.0
#chown vagrant:vagrant /home/vagrant/Hyperledger -R
