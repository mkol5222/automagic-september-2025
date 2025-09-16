
module "vwan" {
    depends_on = [checkpoint_management_host.codespace]
  source = "./vwan"
  envId = local.envId
}
