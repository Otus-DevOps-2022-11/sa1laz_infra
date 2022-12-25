# sa1laz_infra
sa1laz Infra repository
#DZ3 cloud-bastion
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

#DZ4 cloud-testapp
testapp_IP = 84.252.129.135
testapp_port = 9292

##To deploy testapp using cloud-init we need to run:
yc compute instance create \
  --name reddit-app1 \
  --hostname reddit-app1 \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=cloud-config.yaml
