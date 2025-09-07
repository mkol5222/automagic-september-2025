#!/bin/bash

set -euo pipefail

RG=$(terraform output -raw rg)
NAME=$(terraform output -raw name)
ADMIN_PASSWORD=$(terraform output -raw admin_password)

CPMAN_IP=$(az vm show -d --resource-group "$RG" --name "$NAME" --query "publicIps" -o tsv)

cat <<EOF | tee ../secrets/management.env

export CHECKPOINT_SERVER="$CPMAN_IP"
export CHECKPOINT_USERNAME="admin"
export CHECKPOINT_PASSWORD="$ADMIN_PASSWORD"

export CHECKPOINT_MANAGEMENT_RG="$RG"
export CHECKPOINT_MANAGEMENT_NAME="$NAME"


EOF