#!/bin/bash

# if ~/.ssh/id_rsa.pub does not exist, create key without passphrase
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
fi

set -euo pipefail

RG=$(terraform output -raw rg)
NAME=$(terraform output -raw name)
ADMIN_PASSWORD=$(terraform output -raw admin_password)

GW_IP=$(az vm show -d --resource-group "$RG" --name "$NAME" --query "publicIps" -o tsv)

cat <<EOF

GATEWAY deployment info:

Resource Group:   $RG
Name:             $NAME
Admin Username:   admin
Admin Password:   $ADMIN_PASSWORD
Gateway IP:       $GW_IP

EOF

sshpass -p "$ADMIN_PASSWORD" ssh-copy-id -o StrictHostKeyChecking=no "admin@$GW_IP"
