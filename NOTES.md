# NOTES

```bash

# install gum
#   https://github.com/charmbracelet/gum

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum
# optional VHS
sudo apt update && sudo apt install vhs ffmpeg

# list all NIC in my account with az cli
az network nic list --query '[].{Name:name, ResourceGroup:resourceGroup}' -o tsv 

az network nic list

az network nic show-effective-route-table --resource-group automagic-management-7c65eed5 --name cpman-7c65eed5-eth0

az network nic show-effective-route-table --resource-group automagic-management-7c65eed5 --name cpman-7c65eed5-eth0 -o table

# choose NIC and show effective route table
NIC=$(az network nic list --query '[].{Name:name, ResourceGroup:resourceGroup}' -o tsv | sort | gum filter --no-limit --placeholder "Type to filter NICs" )
echo $NIC
# split TSV to RG and NIC name
RG=$(echo $NIC | awk '{print $2}')
NIC_NAME=$(echo $NIC | awk '{print $1}')
echo "Resource Group: $RG"
echo "NIC Name: $NIC_NAME"
az network nic show-effective-route-table --resource-group $RG --name $NIC_NAME -o table | gum pager


# install ttyd
cd $(mktemp -d)
sudo apt-get update
sudo apt-get install -y build-essential cmake git libjson-c-dev libwebsockets-dev
git clone https://github.com/tsl0922/ttyd.git
cd ttyd && mkdir build && cd build
cmake ..
make && sudo make install

# asciinema
sudo apt install asciinema

# az network nic show-effective-route-table --resource-group automagic-management-7c65eed5 --name cpman-7c65eed5-eth1
```