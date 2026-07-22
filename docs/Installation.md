# Jenkins Installation

## Prerequisites

- Ubuntu EC2
- Port 22 Open
- Port 8080 Open

## Installation

Run

sudo ./install-jenkins.sh

## Verify

sudo systemctl status jenkins

## Initial Password

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
