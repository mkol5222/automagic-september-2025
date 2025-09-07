
# Adding SSH key access


```bash
# source machine
KEY=$(cat ~/.ssh/id_rsa.pub)
echo "export KEY=\"$KEY\""

RG=$(terraform output -raw rg)
NAME=$(terraform output -raw name)
ADMIN_PASSWORD=$(terraform output -raw admin_password)
CPMAN_IP=$(az vm show -d --resource-group "$RG" --name "$NAME" --query "publicIps" -o tsv)

# basically ssh-copy-id
ssh-copy-id -i ~/.ssh/id_rsa.pub admin@"$CPMAN_IP"

# now go to target
ssh admin@"$CPMAN_IP"

# target machine
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Ensure authorized_keys file exists
touch "$HOME/.ssh/authorized_keys"
chmod 600 "$HOME/.ssh/authorized_keys"

# Append key if not already present - TODO!!!
grep -qxFf "$KEY" "$HOME/.ssh/authorized_keys" || echo "$KEY" >> "$HOME/.ssh/authorized_keys"

# Ensure ownership is correct (important if run with sudo)
chown -R "$(id -u):$(id -g)" "$HOME/.ssh"
```