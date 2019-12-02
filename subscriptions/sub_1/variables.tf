variable "resource_group_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "app_subnet_name" {
  type = string
}

variable "sql_subnet_name" {
  type = string
}

variable "application_nsg" {
  type = string
}

variable "count_vm" {
  type = number
}

variable "sql_host_basename" {
  type = string
}

variable "app_host_basename" {
  type = string
}

variable "storage_account_suffix" {
  type = string
}

variable "virtual_machine_size" {
  type = string
}

variable "virtual_machine_image_publisher" {
  type = string
}

variable "virtual_machine_image_offer" {
  type = string
}

variable "virtual_machine_image_sku" {
  type = string
}

variable "virtual_machine_image_version" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "ip_list" {
  description = "List of ips from which inbound connection to VMs is allowed"
  type        = list(string)
  default     = ["a.a.a.a","b.b.b.b","c.c.c.c"]
}