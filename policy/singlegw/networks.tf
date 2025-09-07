
resource "checkpoint_management_network" "singlegw_vnet" {
  name = "singlegw_vnet"
  subnet4 = "10.104.0.0"
  mask_length4 = 16
  color = "green"
  comments = "VNet for single gateway scenario"
}

resource "checkpoint_management_network" "singlegw_web_subnet" {
  name = "singlegw_web_subnet"
  subnet4 = "10.104.2.0"
  mask_length4 = 24
  color = "green"
  comments = "Web subnet for single gateway scenario"
}

resource "checkpoint_management_network" "singlegw_app_subnet" {
  name = "singlegw_app_subnet"
  subnet4 = "10.104.3.0"
  mask_length4 = 24
  color = "green"
  comments = "App subnet for single gateway scenario"
}