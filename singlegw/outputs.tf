output "sic_key" {
  description = "SIC key for the gateway"
  value       = var.sic_key
  sensitive   = true
}

output "rg" {
  description = "Resource group name"
  value       = local.rg_name
}

output "name" {
  description = "Name of the gateway"
  value       = local.gw_name
}

output "admin_password" {
  description = "Admin password for the gateway"
  value       = local.admin_password
  sensitive   = true
}
