locals {
  layer_name = "${checkpoint_management_package.vwan.name} Network"
}

data "checkpoint_management_data_access_rule" "data_access_rule" {
  name = "Cleanup rule"
  layer = local.layer_name
}