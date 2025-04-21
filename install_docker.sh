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


# Check if the user is in the Docker group
echo "Checking if user is in the Docker group..."
if groups $USER | grep &>/dev/null '\bdocker\b'; then
    # If the user is in the Docker group, no action is needed
    echo "User $USER is in the Docker group."
else
    # If the user is not in the Docker group, add them
    # Add the current user to the Docker group to avoid using sudo with Docker commands
    echo "Adding current user to Docker group..."  
    sudo usermod -aG docker $USER
    echo "User $USER added to Docker group. Please log out and back in for the changes to take effect."
    echo "If you don't want to log out, you can run the following command to apply the group changes:"
fi

# Verify the installation
echo "Verifying Docker installation..."
docker --version

echo "Docker installation complete!"