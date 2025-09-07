
# use new Check Point module to create Security Management including network environment

# https://github.com/CheckPointSW/terraform-azure-cloudguard-network-security/tree/master/modules/management_new_vnet

provider "azurerm" {
  features {}
}

locals {
    rg =  "automagic-management-${local.envId}"
    location = "northeurope"
    mgmt_name = "cpman-${local.envId}"
    vnet_name = "automagic-management-vnet-${local.envId}"
    vnet_address = "10.0.0.0/16"
    management_subnet = "10.0.1.0/24"
    vm_size = "Standard_D3_v2"
    admin_password =  random_password.admin_password.result
}

module "management" {

    source  = "CheckPointSW/cloudguard-network-security/azure//modules/management_new_vnet"
    version = "1.0.4"


    source_image_vhd_uri            = "noCustomUri"
    resource_group_name             = local.rg
    mgmt_name                       = local.mgmt_name
    location                        = local.location
    vnet_name                       = local.vnet_name
    address_space                   = local.vnet_address
    subnet_prefix                   = local.management_subnet
    management_GUI_client_network   = "0.0.0.0/0"
    mgmt_enable_api                 = "all"
    admin_password                  = local.admin_password
    vm_size                         = local.vm_size
    disk_size                       = "110"
    vm_os_sku                       = "mgmt-byol"
    vm_os_offer                     = "check-point-cg-r82" #"check-point-cg-r8120"
    os_version                      = "R82" #"R8120"
    bootstrap_script                = "touch /home/admin/bootstrap.txt; echo 'hello_world' > /home/admin/bootstrap.txt"
    allow_upload_download           = true
    authentication_type             = "Password"
    admin_shell                     = "/bin/bash"
    serial_console_password_hash    = ""
    maintenance_mode_password_hash  = ""
    nsg_id                          = ""
    add_storage_account_ip_rules    = false
    storage_account_additional_ips  = []
}