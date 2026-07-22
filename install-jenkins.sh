#!/bin/bash

set -e

echo "Updating packages..."
sudo apt update -y

echo "Installing Java..."
sudo apt install -y openjdk-21-jdk curl gnupg

echo "Removing old Jenkins repository (if any)..."
sudo rm -f /etc/apt/sources.list.d/jenkins.list
sudo rm -f /usr/share/keyrings/jenkins-keyring.asc
sudo rm -f /usr/share/keyrings/jenkins-keyring.gpg

echo "Adding Jenkins GPG key..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
| gpg --dearmor \
| sudo tee /usr/share/keyrings/jenkins-keyring.gpg > /dev/null

echo "Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" \
| sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package list..."
sudo apt update

echo "Installing Jenkins..."
sudo apt install -y jenkins

echo "Starting Jenkins..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "Jenkins Installed Successfully!"