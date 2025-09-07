
locals {
  rg_name      = "automagic-singlegw-${local.envId}"
  location     = "North Europe"
  vnet_name    = "vnet-singlegw-${local.envId}"
  vnet_address = "10.104.0.0/16"

  subnets = [
    {
      name    = "frontend"
      address = "10.104.0.0/24"
    },
    {
      name    = "backend"
      address = "10.104.1.0/24"
    },
    {
      name    = "web"
      address = "10.104.2.0/24"
    },
    {
      name    = "app"
      address = "10.104.3.0/24"
    }
  ]
  frontend_first_ip = "10.104.0.4"
  backend_first_ip  = "10.104.1.4"

  gw_name = "azure-gw-${local.envId}"



  admin_password = random_password.admin_password.result
  sic_key        = var.sic_key
  vm_size        = "Standard_D4ds_v5"
}



resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = local.location


}

module "vnet" {

  depends_on = [azurerm_resource_group.rg]

  source = "./vnet"

  envId        = local.envId
  location     = azurerm_resource_group.rg.location
  rg_name      = azurerm_resource_group.rg.name
  vnet_name    = local.vnet_name
  vnet_address = local.vnet_address
  subnets      = local.subnets
}


module "gw" {
  depends_on = [module.vnet]
  source     = "CheckPointSW/cloudguard-network-security/azure//modules/single_gateway_existing_vnet"
  version    = "1.0.5"

  source_image_vhd_uri           = "noCustomUri"
  resource_group_name            = local.rg_name
  single_gateway_name            = local.gw_name
  location                       = local.location
  vnet_name                      = local.vnet_name
  vnet_resource_group            = local.rg_name
  subnet_frontend_name           = "frontend"
  subnet_backend_name            = "backend"
  subnet_frontend_1st_Address    = local.frontend_first_ip
  subnet_backend_1st_Address     = local.backend_first_ip
  management_GUI_client_network  = "0.0.0.0/0"
  admin_password                 = local.admin_password
  smart_1_cloud_token            = ""
  sic_key                        = local.sic_key
  vm_size                        = local.vm_size
  disk_size                      = "110"
  vm_os_sku                      = "sg-byol"
  vm_os_offer                    = "check-point-cg-r82"
  os_version                     = "R82"
  bootstrap_script               = "touch /home/admin/bootstrap.txt; echo 'hello_world' > /home/admin/bootstrap.txt"
  allow_upload_download          = true
  authentication_type            = "Password"
  enable_custom_metrics          = true
  admin_shell                    = "/bin/bash"
  installation_type              = "gateway"
  serial_console_password_hash   = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  maintenance_mode_password_hash = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  nsg_id                         = ""
  add_storage_account_ip_rules   = false
  storage_account_additional_ips = []

}