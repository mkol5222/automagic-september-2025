
output "admin_password" {
  value = random_password.admin_password.result
  sensitive = true
  description = "The admin password for the management VM (default user admin)"
}

output "rg" {
    value = local.rg
    description = "The resource group name for the management server resources"
}

output "name" {
    value = local.mgmt_name
    description = "The name of the management server VM"
}