# Lightweight Container Orchestration

Infrastructure as Code (IaaC) for deploying and managing a lightweight container orchestration platform across multiple cloud providers.

## 🚀 Overview

This repository provides complete Infrastructure as Code (IaaC) solutions for provisioning and managing container orchestration infrastructure on AWS, Azure, and GCP. It includes Terraform modules, Ansible playbooks, Docker Compose configurations, and Kubernetes manifests.

## 📋 Features

- **Multi-Cloud Support**: Deploy on AWS, Azure, or GCP
- **Automated Provisioning**: Terraform modules for infrastructure setup
- **Configuration Management**: Ansible playbooks for cluster configuration
- **Container Orchestration**: Docker Swarm and Kubernetes support
- **Monitoring**: Integrated Prometheus, Grafana, and cAdvisor
- **High Availability**: Multi-node cluster setup with master and worker nodes
- **Security**: Configurable security groups and firewall rules

## 🏗️ Architecture

The infrastructure consists of:
- **Master Node**: Orchestration control plane
- **Worker Nodes**: Application workload execution
- **Networking**: VPC/VNet with public subnets
- **Security**: Security groups/NSGs with controlled access
- **Monitoring**: Prometheus, Grafana, and cAdvisor stack

## 📦 Prerequisites

### Required Tools

1. **Terraform** (>= 1.0)
   ```bash
   # Install on Linux/macOS
   wget https://releases.hashicorp.com/terraform/1.6.0/terraform_1.6.0_linux_amd64.zip
   unzip terraform_1.6.0_linux_amd64.zip
   sudo mv terraform /usr/local/bin/
   ```

2. **Ansible** (>= 2.9)
   ```bash
   # Install using pip
   pip install ansible
   ```

3. **Cloud CLI Tools**
   - AWS: `aws-cli`
   - Azure: `azure-cli`
   - GCP: `gcloud`

4. **Docker** (for local development)
   ```bash
   curl -fsSL https://get.docker.com | sh
   ```

### Cloud Provider Setup

#### AWS
```bash
# Configure AWS credentials
aws configure
```

#### Azure
```bash
# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login
```

#### GCP
```bash
# Install gcloud
curl https://sdk.cloud.google.com | bash

# Login to GCP
gcloud auth login
gcloud config set project YOUR_PROJECT_ID
```

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/smartx-usman/lightweight-container-orchestration.git
cd lightweight-container-orchestration
```

### 2. Choose Your Cloud Provider

#### AWS Deployment

```bash
# Configure variables
cd terraform/aws
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your settings

# Deploy infrastructure
cd ../../scripts
./deploy-aws.sh
```

#### Azure Deployment

```bash
# Configure variables
cd terraform/azure
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your settings

# Deploy infrastructure
cd ../../scripts
./deploy-azure.sh
```

#### GCP Deployment

```bash
# Configure variables
cd terraform/gcp
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your settings

# Deploy infrastructure
cd ../../scripts
./deploy-gcp.sh
```

### 3. Configure the Cluster

```bash
# Update Ansible inventory with deployed IPs
cd ansible
cp inventory.ini.example inventory.ini
# Edit inventory.ini with the IPs from Terraform output

# Run setup playbook
ansible-playbook playbooks/setup-cluster.yml

# Initialize Docker Swarm
ansible-playbook playbooks/init-swarm.yml

# Deploy monitoring (optional)
ansible-playbook playbooks/deploy-monitoring.yml
```

### 4. Deploy Applications

#### Using Docker Compose

```bash
# Deploy stack to Docker Swarm
cd docker-compose
docker stack deploy -c docker-compose.yml myapp
```

#### Using Kubernetes

```bash
# Apply Kubernetes manifests
cd kubernetes
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f configmap.yaml
kubectl apply -f ingress.yaml
```

## 📁 Project Structure

```
.
├── terraform/              # Infrastructure as Code
│   ├── aws/               # AWS Terraform modules
│   ├── azure/             # Azure Terraform modules
│   └── gcp/               # GCP Terraform modules
├── ansible/               # Configuration Management
│   ├── playbooks/         # Ansible playbooks
│   ├── ansible.cfg        # Ansible configuration
│   └── inventory.ini.example
├── docker-compose/        # Docker Compose configurations
│   ├── docker-compose.yml
│   └── prometheus.yml
├── kubernetes/            # Kubernetes manifests
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── configmap.yaml
│   └── ingress.yaml
└── scripts/              # Deployment scripts
    ├── deploy-aws.sh
    ├── deploy-azure.sh
    ├── deploy-gcp.sh
    └── destroy.sh
```

## 🔧 Configuration

### Terraform Variables

Each cloud provider has its own set of variables. Copy the `terraform.tfvars.example` file and customize:

- **cluster_name**: Name for your cluster
- **environment**: Environment tag (dev/staging/prod)
- **worker_count**: Number of worker nodes
- **instance_type/vm_size**: Machine types for nodes
- **allowed_ssh_cidr**: IP ranges allowed for SSH access

### Ansible Configuration

Update `ansible/inventory.ini` with your infrastructure IPs:

```ini
[master]
master-node ansible_host=<MASTER_IP> ansible_user=ubuntu

[workers]
worker-1 ansible_host=<WORKER_1_IP> ansible_user=ubuntu
worker-2 ansible_host=<WORKER_2_IP> ansible_user=ubuntu
```

## 🔍 Monitoring

Access monitoring dashboards:

- **Prometheus**: `http://<master-ip>:9090`
- **Grafana**: `http://<master-ip>:3000` (admin/admin)
- **cAdvisor**: `http://<master-ip>:8080`

## 🧹 Cleanup

To destroy the infrastructure:

```bash
cd scripts
./destroy.sh
```

## 🔒 Security Best Practices

1. **SSH Access**: Restrict `allowed_ssh_cidr` to your IP range
2. **Secrets Management**: Use cloud provider secret managers
3. **Network Segmentation**: Use private subnets for workers
4. **Regular Updates**: Keep base images and packages updated
5. **TLS/SSL**: Enable encryption for all external communications

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

Muhammad Usman

## 🙏 Acknowledgments

- Docker Swarm documentation
- Kubernetes documentation
- Terraform providers
- Ansible community