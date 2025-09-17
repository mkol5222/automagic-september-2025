#!/bin/bash

# Ensure az CLI is logged in
az account show &> /dev/null || { echo "Please login using 'az login' first."; exit 1; }

# List all vHubs with their names, resource groups, and IDs
vHubs=$(az network vhub list --query "[].{name:name, id:id}" -o tsv)

# Let user select a vHub using fzf
selected=$(echo "$vHubs" | fzf --prompt="Select a vHub: " --with-nth=1)

if [ -z "$selected" ]; then
    echo "No vHub selected."
    exit 1
fi

# Extract the vHub resource ID (second column)
vhub_id=$(echo "$selected" | awk '{print $2}')

# Construct Azure portal URL
url="https://portal.azure.com/#resource$vhub_id"

# Open in default browser (Linux or macOS)
xdg-open "$url" &> /dev/null || open "$url" &> /dev/null

echo "Opening $url..."
