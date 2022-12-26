#!/bin/sh
apt update
apt install -y jq
templateid=$(yc compute image list --format json | jq -r -M '[.[] | select(.family == "reddit-base")] | max_by(.created_at) | .id')
yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --create-boot-disk image-id=${templateid},size=10GB --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --ssh-key ~/.ssh/id_rsa
