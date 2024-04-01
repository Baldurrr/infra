#!/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
BLUE=`tput setaf 4`
YELLOW=`tput setaf 3`
WHITE=`tput setaf 7`
RESET=`tput sgr0`

# Upgrade Docker-compose
echo "${YELLOW}# Updating repo list #${RESET}"
apt update && apt upgrade -y
apt install apt-transport-https software-properties-common  ca-certificates gnupg lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce

echo "${GREEN}OK!${RESET}"
echo -e "\n"

echo "${YELLOW}# Installing docker #${RESET}"
apt-get update -y
apt-get install docker-ce docker-ce-cli -y


echo "${YELLOW}# Installing docker-compose #${RESET}"
wget https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64

chmod +x docker-compose-linux-x86_64
mv docker-compose-linux-x86_64 /usr/bin/docker-compose

docker-compose version

echo "${GREEN}OK!${RESET}"
echo -e "\n"

echo "${YELLOW}# Rebooting in 10s #${RESET}"
sleep 10
reboot now
