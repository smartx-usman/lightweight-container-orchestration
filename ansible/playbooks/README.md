# Ansible Playbooks

This directory contains Ansible playbooks for infrastructure setup and management.

## Available Playbooks

### setup.yml
Basic setup playbook for preparing container hosts with essential packages and directories.

**Usage:**
```bash
ansible-playbook -i ../inventory/hosts setup.yml
```

### deploy-monitoring.yml
Deploys monitoring infrastructure for the container orchestration system.

**Usage:**
```bash
ansible-playbook -i ../inventory/hosts deploy-monitoring.yml
```

## Creating New Playbooks

When creating new playbooks:
1. Use descriptive names (e.g., `deploy-service.yml`)
2. Include documentation in comments
3. Use variables for configurable values
4. Add error handling and validation
5. Test in a safe environment first

## Example Playbook Structure

```yaml
---
- name: Descriptive playbook name
  hosts: target_group
  become: yes
  gather_facts: yes
  
  vars:
    variable_name: value
  
  tasks:
    - name: Task description
      module_name:
        parameter: value
```
