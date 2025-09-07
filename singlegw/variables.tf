variable "sic_key" {
  description = "SIC key for the gateway"
  type        = string
}

variable "fw_enabled" {
  description = "Enable CloudGuard Firewall"
  type        = bool
  default     = true
}