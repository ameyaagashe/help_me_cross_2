
variable "vm_count" {
  type = number
}

variable "base_hostname" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "vm_publisher" {
  type = string
}

variable "vm_offer" {
  type = string
}

variable "vm_sku" {
  type = string
}

variable "vm_img_version" {
  type = string
}

variable "caching_option" {
  type    = string
  default = "ReadWrite"
}

variable "create_option" {
  type    = string
  default = "FromImage"
}

variable "managed_disk_std_lrs" {
  type    = string
  default = "Standard_LRS"
}

variable "managed_disk_prem_lrs" {
  type    = string
  default = "Premium_LRS"
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}







