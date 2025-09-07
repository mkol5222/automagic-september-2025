// random admin password
resource "random_password" "admin_password" {
  length           = 16
  special          = true
  upper            = true
  lower            = true
  numeric          = true
  override_special = "!@#$%^&*()_+"
  keepers = {
    // generate a new password only if this value changes
    sic_key = var.sic_key
  }
}