#!/bin/bash

set -euo pipefail

RG=$(terraform output -raw rg)
NAME=$(terraform output -raw name)
ADMIN_PASSWORD=$(terraform output -raw admin_password)

GATEWAY_IP=$(az vm show -d --resource-group "$RG" --name "$NAME" --query "publicIps" -o tsv)
SIC_KEY=$(terraform output -raw sic_key)

cat <<EOF

SINGLE GATEWAY deployment info:

Resource Group:   $RG
Name:             $NAME
Admin Username:   admin
Admin Password:   $ADMIN_PASSWORD
Gateway IP:       $GATEWAY_IP
SIC key:          $SIC_KEY
GaiaOS Web UI:    https://$GATEWAY_IP:443

Commands:
    ssh admin@$GATEWAY_IP
    ssh-copy-id admin@$GATEWAY_IP   # to setup key-based auth (assuming you have a key in ~/.ssh/id_rsa.pub)

EOF