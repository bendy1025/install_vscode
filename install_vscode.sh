#!/bin/bash

# Update system package list
echo "Updating package list..."
sudo apt update -y

# Install dependencies
echo "Installing dependencies..."
sudo apt install -y wget gpg

# Add Microsoft GPG key
echo "Adding Microsoft GPG key..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/packages.microsoft.gpg > /dev/null

# Add VSCode repository
echo "Adding VSCode repository..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Update package list again
echo "Updating package list after adding VSCode repository..."
sudo apt update -y

# Install VSCode
echo "Installing VSCode..."
sudo apt install -y code

# Confirm installation
echo "VSCode installation completed! Run 'code' to start."

