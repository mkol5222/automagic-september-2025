#!/bin/bash

set -euo pipefail

RG=$(terraform output -raw rg)
NAME=$(terraform output -raw name)

GATEWAY_IP=$(az vm show -d --resource-group "$RG" --name "$NAME" --query "publicIps" -o tsv)

SIC_KEY=$(terraform output -raw sic_key)
ADMIN_PASSWORD=$(terraform output -raw admin_password)

(cd ../management/; ./ssh.sh '(uname -a; uptime)' )

####
mgmt_cli -r true run-script targets automagic-singlegw-dc2e2ef4 script-name "Reset Gateway Password" script 'uname -a; cat /etc/os-release)'