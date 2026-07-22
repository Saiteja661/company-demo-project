#!/bin/bash

set -e

echo "Updating packages..."

sudo apt update -y

echo "Installing Java..."

sudo apt install openjdk-21-jdk -y

echo "Adding Jenkins Repository..."

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

echo "Installing Jenkins..."

sudo apt install jenkins -y

sudo systemctl enable jenkins

sudo systemctl start jenkins

echo "Jenkins Installed Successfully!"