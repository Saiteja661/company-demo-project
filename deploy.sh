#!/bin/bash

echo "Starting Deployment..."

sudo mkdir -p /var/www/html

sudo cp -r Application/* /var/www/html/

echo "Deployment Successful"

ls -la /var/www/html