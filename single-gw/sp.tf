
# retrieve Azure admin SP from JSON in secrets folder
locals {
  secrets = jsondecode(file("${path.module}/../secrets/sp.json"))

  envId        = local.secrets.envId
  appId        = local.secrets.appId
  password     = local.secrets.password
  tenant       = local.secrets.tenant
  subscription = local.secrets.subscriptionId
}

