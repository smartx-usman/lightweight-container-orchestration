#!/bin/bash
set -e

# Update system
apt-get update
apt-get upgrade -y

# Install basic tools
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

# Set hostname based on node type
hostnamectl set-hostname ${node_type}

# Prepare for container orchestration
echo "Node type: ${node_type}" > /etc/node-info.txt
