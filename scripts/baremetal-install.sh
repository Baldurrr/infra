#!/bin/bash

echo "# Disabling restart input #"
sed -i 's/#$nrconf{restart} = '\"'\"'i'\"'\"';/$nrconf{restart} = '\"'\"'a'\"'\"';/g' /etc/needrestart/needrestart.conf
echo "OK!"
echo -e "\n"

# Upgrade Docker-compose
echo "# Updating repo list #"
apt update && apt upgrade -y
apt install apt-transport-https software-properties-common  ca-certificates gnupg lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce

echo "OK!"
echo -e "\n"

echo "# Installing docker #"
apt-get update -y
apt-get install docker-ce docker-ce-cli -y
echo "OK!"
echo -e "\n"

echo "# Installing docker-compose #"
wget https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64

chmod +x docker-compose-linux-x86_64
mv docker-compose-linux-x86_64 /usr/bin/docker-compose

docker-compose version

echo "OK!"
echo -e "\n"

echo "# Rebooting in 10s #"
sleep 10
reboot now
