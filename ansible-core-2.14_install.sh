#!/bin/bash

# If installing via Ansible Tower/AAP, there is no need to run additional configurations.
# If installing via remote server, then you need to run sudo ansible-playbook linux_remote_setup.yml after this script.

sudo dnf remove -y python36

sudo yum install -y python39

# # Create a virtual environment
# python3 -m venv ansible-env

# # Activate the virtual environment
# source ansible-env/bin/activate

# Install Ansible (replace <ansible_version> with the desired version)
pip3 install ansible-core==2.14

# Install ansible collections
ansible-galaxy collection install ansible.windows
ansible-galaxy collection install community.windows
ansible-galaxy collection install microsoft.ad

