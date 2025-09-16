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

###
#
# vWAN egress
#

resource "checkpoint_management_access_section" "vwan_egress_section" {
  name = "vWAN Egress"
  position = {above  = checkpoint_management_access_section.other_rules_section.id}
   layer = local.layer_name
}

resource "checkpoint_management_access_rule" "vnet_egress" {
  name        = "VNet egress"
  layer       = local.layer_name
  position    = { below = checkpoint_management_access_section.vwan_egress_section.id }
  source      = [checkpoint_management_network.vnets.id]
  destination = ["Any"]
  service     = ["Any"]
  content     = ["Any"]
  time        = ["Any"]
  install_on  = ["Policy Targets"]
  track = {
    type                    = "Log"
    accounting              = false
    alert                   = "none"
    enable_firewall_session = false
    per_connection          = true
    per_session             = false
  }
  action_settings = {}
  custom_fields   = {}
  vpn             = "Any"
  action          = "Accept"
}
