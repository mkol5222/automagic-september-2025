#!/bin/bash

set -euo pipefail

RG=$(terraform output -raw rg)
NAME=$(terraform output -raw name)

GATEWAY_IP=$(az vm show -d --resource-group "$RG" --name "$NAME" --query "publicIps" -o tsv)

SIC_KEY=$(terraform output -raw sic_key)
ADMIN_PASSWORD=$(terraform output -raw admin_password)

(cd ../management/; ./ssh.sh '(uname -a; uptime)' )


HASHED_PASSWORD=$(openssl passwd -1 "$ADMIN_PASSWORD")

SCRIPT=$(cat <<EOF | base64 -w0
#!/bin/bash
clish -s -c 'lock database override'
# clish -s -c 'add user admin3 uid 1003 homedir /home/admin3'
# clish -s -c 'add rba user admin3 roles adminRole'
# clish -s -c 'set user admin3 shell /bin/bash'
clish -s -c 'set user admin password-hash $HASHED_PASSWORD'
clish -s -c 'unlock database'
EOF
)


####
(cd ../management/; ./ssh.sh mgmt_cli -r true run-script targets "$NAME" script-name "Reset_Gateway_Password" script-base64 "$SCRIPT")