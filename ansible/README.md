# Ansible Infrastructure as Code

This directory contains Ansible playbooks, roles, and inventory files for reproducible infrastructure creation and management.

## Structure

- `playbooks/` - Ansible playbooks for various infrastructure tasks
- `roles/` - Reusable Ansible roles
- `inventory/` - Inventory files defining target hosts

## Getting Started

### Prerequisites

```bash
# Install Ansible
pip install ansible

# Install required collections (if any)
ansible-galaxy collection install -r requirements.yml
```

### Configuration

1. Copy the example inventory file and customize it:
   ```bash
   cp inventory/hosts.example inventory/hosts
   ```

2. Update the inventory with your target hosts

3. Configure SSH access to target hosts

### Running Playbooks

```bash
# Test connectivity
ansible all -i inventory/hosts -m ping

# Run a playbook
ansible-playbook -i inventory/hosts playbooks/setup.yml
```

## Best Practices

- Use variables for configuration
- Keep secrets in Ansible Vault
- Test playbooks in a safe environment first
- Document role dependencies
- Use tags for selective execution
