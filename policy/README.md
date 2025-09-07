# Policy - basic Security Management policy for lab use using Terraform

### Reference:

* Security Management [terraform provider](https://registry.terraform.io/providers/CheckPointSW/checkpoint/latest/docs)
* Security Management API and mgmt_cli [documentation](https://sc1.checkpoint.com/documents/latest/APIs/)

### Fetch Security Management Creds

```bash
# get info - it has IP, user, pass
make management-info

# is API accessible already? (it takes time on VM startup or deployment)
make management-api

# store API creds to secrets
make management-secrets

# load secrets
source ./secrets/management.env
echo $CHECKPOINT_SERVER

# apply policy
make policy-up
