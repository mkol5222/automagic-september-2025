locals {
  layer_name = "${checkpoint_management_package.vwan.name} Network"
}

data "checkpoint_management_data_access_rule" "data_access_rule" {
    depends_on = [checkpoint_management_package.vwan]
  name = "Cleanup rule"
  layer = local.layer_name
}

####
#
# Cleanup section 
resource "checkpoint_management_access_section" "cleanup_section" {
  name = "Cleanup"
  position = {above  = data.checkpoint_management_data_access_rule.data_access_rule.id}
   layer = local.layer_name
}

###
#
# other rules
#

resource "checkpoint_management_access_section" "other_rules_section" {
  name = "Other rules"
  position = {above  = checkpoint_management_access_section.cleanup_section.id}
   layer = local.layer_name
}
