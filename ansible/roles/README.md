# Ansible Roles

This directory contains reusable Ansible roles for the infrastructure.

## Creating a New Role

Use `ansible-galaxy` to create a new role:

```bash
cd roles
ansible-galaxy init role-name
```

This creates the standard role structure:
```
role-name/
├── defaults/
│   └── main.yml
├── files/
├── handlers/
│   └── main.yml
├── meta/
│   └── main.yml
├── tasks/
│   └── main.yml
├── templates/
├── tests/
│   ├── inventory
│   └── test.yml
└── vars/
    └── main.yml
```

## Role Guidelines

- **tasks/main.yml** - Main tasks for the role
- **defaults/main.yml** - Default variables (lowest precedence)
- **vars/main.yml** - Role variables (higher precedence)
- **handlers/main.yml** - Handlers for service restarts, etc.
- **templates/** - Jinja2 templates
- **files/** - Static files to be copied
- **meta/main.yml** - Role metadata and dependencies

## Using Roles

In a playbook:

```yaml
- name: Example playbook
  hosts: all
  roles:
    - role: role-name
      vars:
        variable: value
```

## Best Practices

- Keep roles focused and single-purpose
- Use meaningful variable names
- Document role variables in README.md
- Test roles independently
- Define dependencies in meta/main.yml
