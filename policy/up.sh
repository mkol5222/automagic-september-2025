#!/bin/bash

set -euo pipefail

export CHECKPOINT_SESSION_NAME="TF $(whoami) $(date) from $(hostname)"
export CHECKPOINT_SESSION_DESCRIPTION="Terraform session description"

# ../secrets/management.env missing?
if [ ! -f ../secrets/management.env ]; then
  echo "Error: ../secrets/management.env is missing"
  exit 1
fi

source ../secrets/management.env
echo "Management IP: $CHECKPOINT_SERVER"
export CHECKPOINT_API_KEY=""


rm sid.json || true # forget previous session
terraform init
if (terraform apply -auto-approve); then 
	echo "Terraform apply succeeded";
    export SID=$(jq -r .sid ./sid.json)
	./publish.sh "$SID";
else
    echo "Terraform apply failed";
    export SID=$(jq -r .sid ./sid.json)
	./discard.sh "$SID"; 
fi
echo "Policy: Done."
