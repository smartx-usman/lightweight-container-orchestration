# Contributing to Lightweight Container Orchestration

Thank you for your interest in contributing to this project! This document provides guidelines for contributions.

## How to Contribute

### Reporting Issues

- Use the GitHub issue tracker to report bugs or suggest features
- Search existing issues before creating a new one
- Provide detailed information including steps to reproduce for bugs

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test your changes thoroughly
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### Coding Standards

#### Terraform
- Use consistent indentation (2 spaces)
- Add comments for complex logic
- Use meaningful variable names
- Follow HashiCorp's Terraform style guide

#### Ansible
- Follow YAML best practices
- Use meaningful playbook and task names
- Add comments for complex tasks
- Test playbooks before submitting

#### Scripts
- Use `#!/bin/bash` shebang
- Add error handling (`set -e`)
- Add comments explaining complex logic
- Make scripts executable

### Testing

Before submitting a PR:
1. Test Terraform configurations with `terraform validate`
2. Test Ansible playbooks with `--check` mode first
3. Verify scripts work on a clean environment
4. Update documentation if needed

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
