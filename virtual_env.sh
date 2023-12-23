sudo dnf remove python36

sudo yum install python39

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