# Security Management

Basic deployment of Security Management server into new network environment using Check Point's [Terraform module](https://github.com/CheckPointSW/terraform-azure-cloudguard-network-security/tree/master/modules/management_new_vnet).

Make sure you have credentials in place based on [instructions](../creds/README.md) before you start.

## Instructions

```bash
# login ADMIN sp
make sp-login

# start deployment
make management-up

# monitor deployment on serial console
make management-serial

# management information to connect with SSH or SmartConsole
make management-info

# connect to management server command-line
make management-ssh
```