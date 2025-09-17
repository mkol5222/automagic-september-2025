#!/bin/bash

# Make sure az CLI is logged in
az account show &> /dev/null || { echo "Please login using 'az login' first."; exit 1; }

# List all resource groups and their IDs
resource_groups=$(az group list --query "[].{name:name, id:id}" -o tsv)

# Use fzf to select one resource group
selected=$(echo "$resource_groups" | fzf --prompt="Select a resource group: " --with-nth=1)

if [ -z "$selected" ]; then
    echo "No resource group selected."
    exit 1
fi

# Extract the resource ID (second column)
resource_id=$(echo "$selected" | awk '{print $2}')

# Construct the Azure portal URL
url="https://portal.azure.com/#resource$resource_id"

# Open the URL in the default browser
xdg-open "$url" &> /dev/null || open "$url" &> /dev/null

echo "Opening $url..."
