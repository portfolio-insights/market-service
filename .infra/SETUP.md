# EC2 Setup Guide for Portfolio Insights

This document outlines the standard setup for launching and configuring an EC2 instance to run the Portfolio Insights market microservice NGINX on Amazon Linux 2023.

---

## 🔧 1. Initial EC2 Setup

### System Update and Git Installation

```bash
sudo dnf update -y
sudo dnf install -y git
```

### Go Installation

```bash
GO_VERSION=1.24.4
cd /usr/local
sudo curl -LO https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' | sudo tee -a /etc/profile
export PATH=$PATH:/usr/local/go/bin
```

---

## 🧬 2. Clone the Project Repository

```bash
git clone https://github.com/jakubstetz/market-service.git
```

Once the project is cloned onto the EC2 instance, running the "Deploy Microservice to EC2" workflow (`microservice.yaml`) in GitHub Actions will deploy the backend.

---

## 📂 `.infra` Folder Structure Overview

- `.infra/SETUP.md` — this setup guide.
- `.infra/user_data.sh` — optional EC2 user-data script to automate instance setup.
