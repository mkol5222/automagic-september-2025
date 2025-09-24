# TF_VAR_subscriptionId=
# TF_VAR_tenant=
# TF_VAR_appId=
# TF_VAR_password=
# TF_VAR_envId=
# TF_VAR_displayName=

variable "subscriptionId" {
  type        = string
  description = "The Subscription ID for the Azure subscription where resources will be created."
}

variable "tenant" {
  type        = string
  description = "The Tenant ID for the Azure subscription where resources will be created."
}

variable "appId" {
  type        = string
  description = "The Application (Client) ID for the Azure Service Principal."
}

variable "password" {
  type        = string
  description = "The Password (Client Secret) for the Azure Service Principal."
  sensitive   = true
}

variable "envId" {
  type        = string
  description = "A short identifier for the environment (e.g., dev, test, prod)."
}