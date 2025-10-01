# Lightweight Container Orchestration

A comprehensive project for running measurements and studies on lightweight container orchestration systems. This project provides infrastructure-as-code using Ansible for reproducible infrastructure creation and management.

## Project Overview

This repository contains:
- **Scripts** for running performance measurements and benchmarks
- **Ansible playbooks** for reproducible infrastructure deployment
- **Study materials** including experiment configurations and results
- **Utilities** for data processing and analysis

## Project Structure

```
.
├── ansible/                    # Infrastructure as Code
│   ├── playbooks/             # Ansible playbooks
│   ├── roles/                 # Reusable Ansible roles
│   ├── inventory/             # Host inventory files
│   ├── ansible.cfg            # Ansible configuration
│   └── requirements.yml       # Ansible Galaxy requirements
├── scripts/                   # Measurement and utility scripts
│   ├── measurements/          # Performance measurement scripts
│   └── utilities/             # Helper utilities
├── studies/                   # Experiments and results
│   ├── experiments/           # Experiment configurations
│   └── results/               # Measurement results and analysis
└── requirements.txt           # Python dependencies
```

## Getting Started

### Prerequisites

- Python 3.8 or higher
- Ansible 2.15 or higher
- SSH access to target hosts (for infrastructure deployment)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/smartx-usman/lightweight-container-orchestration.git
cd lightweight-container-orchestration
```

2. Install Python dependencies:
```bash
pip install -r requirements.txt
```

3. Install Ansible collections:
```bash
cd ansible
ansible-galaxy collection install -r requirements.yml
```

4. Configure your inventory:
```bash
cp ansible/inventory/hosts.example ansible/inventory/hosts
# Edit ansible/inventory/hosts with your target hosts
```

## Usage

### Running Measurements

Example of running a startup time measurement:
```bash
python scripts/measurements/measure_startup_time.py \
    --container my-container \
    --orchestration docker \
    --output results.json
```

### Deploying Infrastructure

Setup container hosts:
```bash
cd ansible
ansible-playbook -i inventory/hosts playbooks/setup.yml
```

Deploy monitoring infrastructure:
```bash
ansible-playbook -i inventory/hosts playbooks/deploy-monitoring.yml
```

### Processing Results

Parse and aggregate measurement results:
```bash
python scripts/utilities/parse_results.py \
    --directory studies/results/experiment-01 \
    --metric startup_time_seconds \
    --output summary.json
```

## Documentation

Each directory contains its own README with detailed information:
- [Scripts Documentation](scripts/README.md)
- [Ansible Documentation](ansible/README.md)
- [Studies Documentation](studies/README.md)

## Contributing

When contributing to this repository:
1. Follow the existing project structure
2. Document your scripts and playbooks
3. Include README files for new directories
4. Test changes in a safe environment

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Muhammad Usman