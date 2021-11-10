#!/bin/bash

terraform init
terraform fmt
terraform plan
terraform apply

echo "[webservers]" > env/hosts
cat terraform.tfstate | grep '"public_ip":' | cut -d '"' -f 4 | { tr -d '\n'; echo " ansible_user=ubuntu"; } >> env/hosts

cat private_key > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

echo "sleeping.."
sleep 2m 30s

echo "|1|xGgpzdLRABgcupKI2FldqScDySk=|ICZuBEZ2zlltXgKDITpBRGpHie4= ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHYgaDqrGvGFEBifOAAjn74hicQe4A22ycWT69SgM1T4v3ZnAqHU+gRpnnnk08M73952fIBYdnOvRlONrcXb9Ok=" > ~/.ssh/known_hosts

ansible-playbook -i env/hosts site.yaml
