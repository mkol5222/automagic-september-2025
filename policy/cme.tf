resource "checkpoint_management_cme_accounts_azure" "azure_account" {
  name           = "myazure"
  directory_id   = local.secrets.tenant
  application_id = local.secrets.appId
  client_secret  = local.secrets.password
  subscription   = local.secrets.subscriptionId
  environment    = "AzureCloud"
}
