resource "checkpoint_management_package" "singlegw" {
  name              = "singlegw"
  comments          = "Policy for single gateway"
  color             = "orange"
  threat_prevention = false
  access            = true
}

# https://registry.terraform.io/providers/CheckPointSW/checkpoint/latest/docs/resources/checkpoint_management_package

# https://registry.terraform.io/providers/CheckPointSW/checkpoint/latest/docs/data-sources/checkpoint_management_data_access_layer