# Linux * Windows Server * Setup

* Environment setup for linux and windows servers as related to winrm connection.

## Description

* The purpose of this project is to automate test environment for linux and windows systems for coding.

## Getting Started

### Dependencies

* Utilizing cloud AWS servers for deployment.

### Executing program

* The initial execution is the result of launching env_start.sh.

## Authors

Contributors names and contact info

https://github.com/c-poteat

## Version History

* 0.1 - Initial release

## Potential Adds / Changes

Playbook to do the following:<br>
Encrypt ssh keys (private and public key) using ansible vault<br> 
Copy ssh keys into github with encryption<br>
Use playbook to decrypt ssh public key<br>
transfer ssh keys to .ssh location on linux server<br>
change permissions for ssh key with chmod 600 ~/.ssh/id_rsa

## Ansible Instructions:

Create an encrypted file
The ansible-vault create command is used to create the encrypted file.
```
ansible-vault create vault.yml
```
Editing the encrypted file
If the file is encrypted and changes are required, use the edit command.
```
ansible-vault edit secure.yml
```
Decrypting a file
The ansible-vault decrypt command is used to decrypt the encrypted file.
```
ansible-vault decrypt secure.yml
```
Decrypt a running playbook
To decrypt the playbook while it is running, you usually ask for its password.
```
ansible-playbook --ask-vault-pass email.yml
```
Reset the file password
Use the ansible-vault rekey command to reset the encrypted file password.


1. Create a Vault Password File
Create a file and write your Ansible Vault password in it. For example:
```
echo "yourVaultPassword" > /path/to/vault_password_file
```
Ensure this file is securely stored and has restricted permissions, as it contains a sensitive password. You can set the file permissions with:
```
chmod 600 /path/to/vault_password_file
```
2. Use the Password File with ansible-playbook
When running your playbook, use the --vault-password-file option to specify the path to your vault password file. For example:
```
ansible-playbook --vault-password-file /path/to/vault_password_file test_vault.yml
```
3. Set Up an Ansible Configuration File (Optional)
Alternatively, you can configure Ansible to always use a specific vault password file by setting it in the Ansible configuration file (ansible.cfg). This way, you don't have to specify the --vault-password-file option each time.

In your ansible.cfg file, add:
[defaults]
vault_password_file = /path/to/vault_password_file

With this configuration, you can run your playbook as usual, and Ansible will automatically use the specified vault password file:
```
ansible-playbook test_vault.yml
```
