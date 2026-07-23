#!/bin/bash

set -e

echo "======================================"
echo " Jenkins Installation Started"
echo "======================================"

echo "Updating package list..."
sudo apt update -y

echo "Upgrading packages..."
sudo apt upgrade -y

echo "Installing required packages..."
sudo apt install -y openjdk-21-jdk curl wget gnupg

echo "Java Version:"
java -version

echo "Creating keyrings directory..."
sudo mkdir -p /etc/apt/keyrings

echo "Removing old Jenkins repository (if exists)..."
sudo rm -f /etc/apt/sources.list.d/jenkins.list
sudo rm -f /etc/apt/keyrings/jenkins-keyring.asc

echo "Downloading latest Jenkins GPG key..."
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "Adding Jenkins repository..."
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package list..."
sudo apt update

echo "Installing Jenkins..."
sudo apt install -y jenkins

echo "Enabling Jenkins..."
sudo systemctl enable jenkins

echo "Starting Jenkins..."
sudo systemctl start jenkins

echo "Checking Jenkins status..."
sudo systemctl status jenkins --no-pager

echo ""
echo "======================================"
echo " Jenkins Installed Successfully!"
echo "======================================"
echo ""
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo ""
echo "Access Jenkins at:"
echo "http://<EC2-PUBLIC-IP>:8080"