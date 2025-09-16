#!/bin/bash

set -euo pipefail


# if ~/.ssh/id_rsa.pub does not exist, create key without passphrase
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
fi

terraform destroy -auto-approve

echo "remaining resources (if any):"
terraform state list
echo "---"
