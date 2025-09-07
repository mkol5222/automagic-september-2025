resource "checkpoint_management_package" "vmss" {
  name              = "VMSS"
  comments          = "Policy for VMSS gateways"
  color             = "blue"
  threat_prevention = false
  access            = true
}