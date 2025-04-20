#!/bin/bash

# Exit immediately if a command fails
set -e

echo "Updating package list..."
sudo apt-get update

echo "Installing Docker and related components..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Docker installation complete!"