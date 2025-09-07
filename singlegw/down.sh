#!/bin/bash

set -euo pipefail


# random password for sic key
SIC_KEY=$(cat ../secrets/singlegw-sic.txt 2>/dev/null || true)
if [[ -z "$SIC_KEY" ]]; then
    echo "Generating random VMSS SIC key..."
    SIC_KEY=$(openssl rand -base64 16 | tr -d '=/+')
    echo -n "$SIC_KEY" > ../secrets/singlegw-sic.txt
fi
export TF_VAR_sic_key="$SIC_KEY"



terraform destroy -auto-approve -target module.gw
terraform destroy -auto-approve

echo "Remaining resources (if any):"
terraform state list
echo "---"
