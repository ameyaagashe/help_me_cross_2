variable "app_nsg" {
  type = string
}

variable "allowed_source_ips" {
  description = "List of ips from which inbound connection to VMs is allowed"
  type        = list(string)
}