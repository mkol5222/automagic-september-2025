resource "checkpoint_management_host" "codespace" {
  name = "codespace"
  ipv4_address = var.codespace_ip
  color = "blue"
  tags = ["tag1", "tag2", "madeByTf"]
  comments = "Codespace host used for management"
}