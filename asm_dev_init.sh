#!/bin/bash

# Update and Upgrade the System
sudo apt-get update && sudo apt-get upgrade -y

# Install Deno
curl -fsSL https://deno.land/x/install/install.sh | sh
echo 'export DENO_INSTALL="/home/$USER/.deno"' >> ~/.bashrc
echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Install Node.js (LTS Version)
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

# Install Visual Studio Code
sudo snap install --classic code

# Install Git
sudo apt-get install -y git

# Docker Installation
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# Post-installation steps for Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# Install Docker Compose (if needed)
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install VSCode Remote - Containers Extension
code --install-extension ms-vscode-remote.remote-containers

echo "Environment setup complete. Please restart your computer for all changes to take effect."

