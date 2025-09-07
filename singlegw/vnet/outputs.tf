output "nsg_id" {
  description = "Network security group ID"
  value       = azurerm_network_security_group.sg_nsg.id
}

# subnet id by subnet name
output "subnet_id" {
  description = "Subnet ID"
  value       = { for s in azurerm_subnet.subnet : s.name => s.id }
}