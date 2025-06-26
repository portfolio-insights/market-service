#!/bin/bash
# This script runs automatically when EC2 instance boots if provided as User Data
# It sets up the EC2 instance with everything needed to deploy the Go microservice

# Wait until network connectivity is established
until ping -c1 github.com &>/dev/null; do
  echo "Waiting for network..."
  sleep 5
done

# Update system and install Git
dnf update -y
dnf install -y git

# Install Go
GO_VERSION=1.24.4
cd /usr/local
curl -LO https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz
rm -rf go
tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
echo 'export PATH=$PATH:/usr/local/go/bin' >> /home/ec2-user/.bashrc
export PATH=$PATH:/usr/local/go/bin

# Pull project
cd /home/ec2-user
git clone https://github.com/jakubstetz/market-service.git

# Completion message
echo ""
echo "✅ EC2 setup complete. Run microservice.yaml workflow in GitHub Actions to deploy microservice."
echo ""