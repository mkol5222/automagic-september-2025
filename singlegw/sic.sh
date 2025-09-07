#!/bin/bash

set -euo pipefail

RG=$(terraform output -raw rg)
NAME=$(terraform output -raw name)
ADMIN_PASSWORD=$(terraform output -raw admin_password)

GATEWAY_IP=$(az vm show -d --resource-group "$RG" --name "$NAME" --query "publicIps" -o tsv)


function wait_for_port() {
    local ip=$1
    local port=$2
    while ! timeout 5 bash -c "</dev/tcp/$ip/$port"; do
        echo "Waiting for $ip:$port to be open..."
        sleep 5
    done
    echo "$ip:$port is now open. Ready to proceed."
}
wait_for_port "${GATEWAY_IP}" "18211"