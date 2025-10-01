#!/bin/bash

# Infrastructure Destruction Script
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Infrastructure Destruction Script ==="
echo ""
echo "Select cloud provider:"
echo "1. AWS"
echo "2. Azure"
echo "3. GCP"
read -p "Enter choice (1-3): " choice

case $choice in
    1)
        TERRAFORM_DIR="$SCRIPT_DIR/../terraform/aws"
        PROVIDER="AWS"
        ;;
    2)
        TERRAFORM_DIR="$SCRIPT_DIR/../terraform/azure"
        PROVIDER="Azure"
        ;;
    3)
        TERRAFORM_DIR="$SCRIPT_DIR/../terraform/gcp"
        PROVIDER="GCP"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

cd "$TERRAFORM_DIR"

echo ""
echo "WARNING: This will destroy all $PROVIDER infrastructure!"
echo "This action cannot be undone."
echo ""
read -p "Are you sure you want to proceed? Type 'yes' to confirm: " confirm

if [ "$confirm" = "yes" ]; then
    echo "Destroying infrastructure..."
    terraform destroy -auto-approve
    echo "Infrastructure destroyed successfully."
else
    echo "Destruction cancelled."
    exit 1
fi
