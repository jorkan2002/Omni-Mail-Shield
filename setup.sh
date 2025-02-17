#!/bin/bash

# Omni Mail Shield - Server Setup Script
# This script sets up the environment for Omni Mail Shield on Ubuntu 22.04 LTS

set -e

echo "🚀 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installing essential packages..."
sudo apt install -y curl git unzip htop ufw software-properties-common

echo "🛡️ Setting up UFW Firewall..."
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status

echo "🐳 Installing Docker & Docker Compose..."
sudo apt install -y docker.io docker-compose
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
newgrp docker

echo "🐍 Installing Python and dependencies..."
sudo apt install -y python3-pip python3-venv
python3 --version
pip3 --version

echo "✅ Setup complete! Please restart your session for changes to take effect."
