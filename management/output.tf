
output "admin_password" {
  value = random_password.admin_password.result
  sensitive = true
  description = "The admin password for the management VM (default user admin)"
}