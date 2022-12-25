# sa1laz_infra
sa1laz Infra repository
bastion_IP = 51.250.64.33
someinternalhost_IP = 10.128.0.26

# Additional task
# to connect ssh someinternalhost - we need to add ~/.ssh/config (for MacOS) or ssh_config (for Linux) file that includes:
## bastion
host bastion
	user slz
	hostname 51.250.64.33
	IdentityFile ~/.ssh/id_rsa
## someinternalhost
host someinternalhost
	user slz
	hostname 10.128.0.26
	proxyjump bastion
