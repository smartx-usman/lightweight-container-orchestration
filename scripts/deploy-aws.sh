#!/bin/bash

# AWS Infrastructure Deployment Script
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TERRAFORM_DIR="$SCRIPT_DIR/../terraform/aws"

echo "=== Deploying AWS Infrastructure ==="

# Check if Terraform is installed
if ! command -v terraform &> /dev/null; then
    echo "Error: Terraform is not installed. Please install it first."
    exit 1
fi

# Navigate to AWS Terraform directory
cd "$TERRAFORM_DIR"

# Check if terraform.tfvars exists
if [ ! -f "terraform.tfvars" ]; then
    echo "Error: terraform.tfvars not found. Please create it from terraform.tfvars.example"
    exit 1
fi

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Validate configuration
echo "Validating Terraform configuration..."
terraform validate

# Plan deployment
echo "Planning deployment..."
terraform plan -out=tfplan

# Apply deployment
echo "Applying deployment..."
read -p "Do you want to proceed with deployment? (yes/no): " confirm
if [ "$confirm" = "yes" ]; then
    terraform apply tfplan
    echo "Deployment complete!"
    echo ""
    echo "Outputs:"
    terraform output
else
    echo "Deployment cancelled."
    rm tfplan
    exit 1
fi

# Clean up plan file
rm tfplan

echo ""
echo "=== Next Steps ==="
echo "1. Update ansible/inventory.ini with the IPs shown above"
echo "2. Run ansible playbooks to configure the cluster"
echo "   cd ../ansible && ansible-playbook playbooks/setup-cluster.yml"
