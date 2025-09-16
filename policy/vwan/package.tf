resource "checkpoint_management_package" "vwan" {
  name              = "vwan"
  comments          = "Policy for vwan"
  color             = "blue"
  threat_prevention = false
  access            = true
}