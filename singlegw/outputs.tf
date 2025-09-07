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

output "subnet_id" {
  description = "Subnet IDs for the entire module - ID by name"
  value       = module.vnet.subnet_id
}

output "web_rg" {
  description = "Resource group name of the web server"
  value       = local.web_rg_name
}

output "web_name" {
  description = "Name of the web server"
  value       = local.web_name
}

output "app_rg" {
  description = "Resource group name of the app server"
  value       = local.app_rg_name
}

output "app_name" {
  description = "Name of the app server"
  value       = local.app_name
}