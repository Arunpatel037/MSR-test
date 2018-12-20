#! /bin/bash
apt-get update -y
sudo curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | apt-key add -qq -
sudo echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial edge" > /etc/apt/sources.list.d/docker.list
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt-get update -qq
sudo apt-get install -y -qq --no-install-recommends docker-ce
sudo apt install nodejs git openssl
sudo wget https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh /tmp/installer.sh
sudo chmod +x /tmp/installer.sh
rm -rf /tmp/installer.sh