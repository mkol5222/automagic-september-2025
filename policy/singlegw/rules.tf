
locals {
  layer_name = "${checkpoint_management_package.singlegw.name} Network"
}

data "checkpoint_management_data_access_rule" "data_access_rule" {
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
# Rules section
#

resource "checkpoint_management_access_section" "rules" {
  name = "Rules"
  position = {above  = checkpoint_management_access_section.cleanup_section.id}
 layer = local.layer_name
}

resource "checkpoint_management_access_rule" "vnet_egress" {
  name        = "SingleGW VNet egress"
  layer       = local.layer_name
  position    = { below = checkpoint_management_access_section.rules.id }
  source      = [checkpoint_management_network.singlegw_vnet.id]
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

// LocalMachine_All_Interfaces

resource "checkpoint_management_access_rule" "codespace_access" {
  name        = "SingleGW access from Codespace"
  layer       = local.layer_name
  position    = { below = checkpoint_management_access_section.rules.id }
  source      = ["codespace"] # [checkpoint_management_host.codespace.id]
  destination =  [local.gw_name] # ["LocalGatewayExternal"]
  service     = ["HTTP", "HTTPS", "SSH", "icmp-proto"]
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