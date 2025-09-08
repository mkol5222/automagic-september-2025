#!/bin/bash

set -euo pipefail

# if ~/.ssh/id_rsa.pub does not exist, create key without passphrase
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
fi

# random password for sic key
SIC_KEY=$(cat ../secrets/singlegw-sic.txt 2>/dev/null || true)
if [[ -z "$SIC_KEY" ]]; then
    echo "Generating random VMSS SIC key..."
    SIC_KEY=$(openssl rand -base64 16 | tr -d '=/+')
    echo -n "$SIC_KEY" > ../secrets/singlegw-sic.txt
fi
export TF_VAR_sic_key="$SIC_KEY"



terraform init
terraform apply -auto-approve -target module.vnet
terraform apply -auto-approve