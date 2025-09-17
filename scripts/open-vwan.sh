#!/bin/bash

# Ensure az CLI is logged in
az account show &> /dev/null || { echo "Please login using 'az login' first."; exit 1; }

# List all Virtual WANs with their names and IDs
vWans=$(az network vwan list --query "[].{name:name, id:id}" -o tsv)

# Let user select a vWAN using fzf
selected=$(echo "$vWans" | fzf --prompt="Select a Virtual WAN: " )
#--with-nth=1

if [ -z "$selected" ]; then
    echo "No Virtual WAN selected."
    exit 1
fi

# Extract the vWAN resource ID (second column)
vwan_id=$(echo "$selected" | awk '{print $2}')

# Construct Azure portal URL
url="https://portal.azure.com/#resource$vwan_id/hubs"

# Open in default browser (Linux or macOS)
xdg-open "$url" &> /dev/null || open "$url" &> /dev/null

echo "Opening $url..."
