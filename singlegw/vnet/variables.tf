
#   envId        = local.envId
#   location     = azurerm_resource_group.rg.location
#   rg_name      = azurerm_resource_group.rg.name
#   vnet_name    = local.vnet_name
#   address_space = local.vnet_address_space

variable "envId" {
  description = "A unique identifier for the environment, used in naming resources."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources into."
  type        = string
  default     = "North Europe"
}

variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "vnet_address" {
  description = "The address space for the virtual network."
  type        = string
}

variable "subnets" {
  description = "A list of subnets to create within the virtual network."
  type = list(object({
    name    = string
    address = string
  }))
  default = []
}