#!/bin/bash

set -euo pipefail

RG=$(terraform output -raw rg)
NAME=$(terraform output -raw name)
ADMIN_PASSWORD=$(terraform output -raw admin_password)

CPMAN_IP=$(az vm show -d --resource-group "$RG" --name "$NAME" --query "publicIps" -o tsv)

cat <<EOF

SECURITY MANAGEMENT deployment info:

Resource Group:   $RG
Name:             $NAME
Admin Username:   admin
Admin Password:   $ADMIN_PASSWORD
Management IP:    $CPMAN_IP

Commands:
    ssh admin@$CPMAN_IP
    ssh-copy-id admin@$CPMAN_IP   # to setup key-based auth (assuming you have a key in ~/.ssh/id_rsa.pub)
EOF