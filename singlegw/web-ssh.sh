#!/bin/bash

# if ~/.ssh/id_rsa.pub does not exist, create key without passphrase
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
fi

set -euo pipefail

RG=$(terraform output -raw web_rg)
NAME=$(terraform output -raw web_name)
# ADMIN_PASSWORD=$(terraform output -raw admin_password)

VMIP=$(az vm show -d --resource-group "$RG" --name "$NAME" --query "publicIps" -o tsv)

cat <<EOF

WEB VM deployment info:

Resource Group:   $RG
Name:             $NAME
Admin Username:   azureuser
VM IP:            $VMIP

EOF

echo "Connecting to $VMIP as azureuser..."
# notice ability to pass commands with script args "$@"
ssh "azureuser@$VMIP" "$@"