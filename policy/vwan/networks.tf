resource "checkpoint_management_network" "vnets" {
  name = "net_vnet_all"
  subnet4 = "10.0.0.0"
  mask_length4 = 8
}