#!/bin/bash

# Specific repo to enable through RHEL system
repo_name="ansible-2.9-for-rhel-8-x86_64-rpms"

# Check if repo is already enabled
if ! dnf repolist | grep -q "$repo_name"; then
  sudo dnf config-manager -- set-enabled "$repo_name"
  echo "Repository '$repo_name' enabled."
else
  echo "Repository '$repo_name' is already enabled."
fi

# Install Ansible
if ! command -v ansible &>/dev/null; then
  sudo dnf install ansible -y 
  echo "Ansible was installed successfully."
  sudo dnf install python3 python3-pip -y 
  echo "Python3-pip was installed successfully."
else
  echo "Item were already installed."
fi 

# Launch ansible playbook
# ansible-playbook packages_to_install.yml