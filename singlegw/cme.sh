#!/bin/bash


set -euo pipefail

RG=$(terraform output -raw rg)
NAME=$(terraform output -raw name)
ADMIN_PASSWORD=$(terraform output -raw admin_password)
GATEWAY_IP=$(az vm show -d --resource-group "$RG" --name "$NAME" --query "publicIps" -o tsv)
SIC_KEY=$(terraform output -raw sic_key)

# use AZ CLI to list NIC IDs of the VM
NIC_ID_ETH0=$(az vm show --resource-group "$RG" --name "$NAME" --query "networkProfile.networkInterfaces[0].id" -o tsv)
NIC_ID_ETH1=$(az vm show --resource-group "$RG" --name "$NAME" --query "networkProfile.networkInterfaces[1].id" -o tsv)


# use AZ CLI to get eth0 and eth1 IPs of the VM using NIC IDs
ETH0_IP=$(az network nic show --ids "$NIC_ID_ETH0" | jq -r '.ipConfigurations[0].privateIPAddress')
ETH1_IP=$(az network nic show --ids "$NIC_ID_ETH1" | jq -r '.ipConfigurations[0].privateIPAddress')


# cat <<EOF
# $RG $NAME $GATEWAY_IP
# $NIC_ID_ETH0 
# $NIC_ID_ETH1
# $ETH0_IP 
# $ETH1_IP
# $SIC_KEY
# EOF

GW="$NAME"
PUBLIC_IP="$GATEWAY_IP"

cat <<EOF
mgmt_cli -r true \
  add simple-gateway \
  name "${GW}" color "blue" \
  ipv4-address "${PUBLIC_IP}" \
  version "R81.20" \
  one-time-password "${SIC_KEY}" \
  firewall true vpn false application-control false url-filtering false ips true \
  anti-bot false anti-virus false threat-emulation false \
  nat-hide-internal-interfaces true \
  icap-server false \
  identity-awareness true \
  identity-awareness-settings.identity-collector true \
  identity-awareness-settings.identity-collector-settings.authorized-clients.client localhost \
  identity-awareness-settings.identity-collector-settings.authorized-clients.client-secret "cnienfrfeinueribf" \
  interfaces.1.name "eth0" interfaces.1.ipv4-address "${ETH0_IP}" interfaces.1.ipv4-network-mask "255.255.255.0" interfaces.1.anti-spoofing false interfaces.1.topology "EXTERNAL" \
  interfaces.2.name "eth1" interfaces.2.ipv4-address "${ETH1_IP}" interfaces.2.ipv4-network-mask "255.255.255.0" interfaces.2.anti-spoofing false interfaces.2.topology "INTERNAL"  \
  --format json
EOF