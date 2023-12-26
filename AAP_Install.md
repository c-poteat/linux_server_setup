# RHEL AAP Install Instructions

## Find AWS AMI
RHEL_HA-8.6.0_HVM-20230118-x86_64-30-Hourly2-GP2
ami-09b659801c07f881c

## Download AAP Setup File

### Install subscription manager
```
sudo yum install -y subscription-manager
```

```
sudo subscription-manager register --auto-attach
```
### Download setup file
link 
https://access.redhat.com/downloads/content/480/ver=2.2/rhel---8/2.2/x86_64/product-software

ansible-automation-platform-setup-bundle-2.2.1-3

### Need to copy the file from local pc to linux
```
scp -i rhel-win.pem.pem ansible-automation-platform-setup-bundle-2.2.1-3.tar.gz ec2-user@IP_ADDRESS_HERE:/home/ec2-user
```

### Extract the file on linux machine
```
tar -xvf ansible-automation-platform-setup-*.tar
```

### Enter directory
```
cd ansible-automation-platform-setup-<version>
```

### Edit hosts file
```
sudo vi /etc/hosts
```

### Now add aap.localhost.com to the end of the line beginning with 127.0.0.1 so it looks like this:
```
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4 aap.localhost.com
```

### Now ping AAP localhost
```
ping aap.localhost.com
```

### Delete original inventory file
```
rm -rf inventory
```

### Paste the following contents and 
```
[automationcontroller]
aap.localhost.com ansible_connection=local

[database]

[all:vars]
admin_password='Password1234'

pg_host=''
pg_port=''

pg_database='awx'
pg_username='awx'
pg_password='Password1234'

registry_url='registry.redhat.io'
registry_username='15765574|ansible-tower' # Change to your username and password
registry_password='eyJhbGciOiJSUzUxMiJ9.eyJzdWIiOiJlZTBmNDllNzE1ZWQ0MmQ3YjZkNzk2MWRiZDA1ZDgwNCJ9.APx3LOHNzp4O2pNewBL5X2CR84vJqL24wPBuEtUfQUU6ckP4CJcYIl2lyr9NQCcapG1rtoTiAp4NHstmroi-m_nCOcr1he8vMsUSNGMKqT-tBr-oe84bENmYM_DNvbQReh1pW4c6D2VQFXC9iN60vNl4cylBSy4BWFeg3Dgj62RQSgDAr8RX4twjh0BDbIE75IcVLK2cyvHTqmSst9kk0q9_iAAvGokxRkEHwurkPg6VCZ0MFG3O6GRtVCVS055mGR6P48Wzhwvm698GKHferVyt-0AqWox83hvQWB-pvRmOgkZyFnsdlHpHNIzCN1_g7LQmkk-Lqw0NYanqU-ag8yHnv_RO4HpOI-PAWponrFk7lU3HRBOAjeyHiW60FwgTtDOftTi7Gz-Uer8mcZfLoyMfByYoK8BUc7lNhCPvG32qkEMkbdB7TFSRmIVqgh3VQ3m8OYCu7IrD3qpLA3faydQIqa8h_XMs9umrSvpb7kctDVrTqwQvZp3rZqZbJE5-qL_xwdgdTCZcVE5JBa8Rhr962K5sLVJLfWRqkAoK3agmzXFYbl16VNtoAfeMblyOK_jQc-WMycxr7C0aQAHQ18Y7zRBVJyRplwyuc1k-zjcZA9GBvhW35fF-NyNIMF2qga-Rz2z_0zOw8zkP1Ioug--sRz8Tgz47UMphlkm'
```

### Now run the setup file for AAP
```
sudo ./setup.sh -e required_ram=2048
```

### Once setup is complete you should be able to access this website
```
https://[Server IP]/#/login
```

### Notes 

AAP was not working originally due to ansible-core 2.14 so I ran the command 
```
sudo dnf downgrade ansible-core-2.13.3
```

### Run the following command to see the list of ansible-core packages
```
sudo dnf --showduplicates list ansible-core
```

Need to downgrade to 2.14 in order to perform testing on windows modules

