#!/bin/bash
 
echo "Preparing for hackathon.."
 
echo "Updating system"
sudo apt-get update && sudo apt-get upgrade -y
 
echo "Installing packages"
sudo apt-get install -y git vim htop golang apt-transport-https ca-certificates nodejs npm
 
mkdir ~/Workspace
git clone https://github.com/timblankers/hyperledger-hackathon.git ~/Workspace/hyperledger-hackathon
 
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
 
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
 
sudo apt-get update
sudo apt-get install -y docker-engine
sudo usermod -aG docker $(whoami)
 
sudo -i
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
 
chmod +x /usr/local/bin/docker-compose
 
exit
