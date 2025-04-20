#!/bin/bash

# Exit immediately if a command fails
set -e

echo "Updating package list..."
sudo apt-get update

# Remove any old versions of Docker
echo "Removing old versions of Docker..."  
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done


# Set up Docker's apt repository.
echo "Installing required packages..."
sudo apt-get install -y ca-certificates curl

echo "Creating keyrings directory..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "Downloading Docker GPG key..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

echo "Setting permissions on GPG key..."
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Adding Docker repository to Apt sources..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \"${UBUNTU_CODENAME:-$VERSION_CODENAME}\") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating package list after adding Docker repository..."
sudo apt-get update


# Install the Docker packages.

echo "Installing Docker and related components..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Docker installation complete!"