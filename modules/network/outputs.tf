# output "network_interface" {
#   value = "azurerm_network_interface.tf-ni.id"
# }
# output "public_ip" {
#   value = "azurerm_network_interface.tf-ni.id"
# }
output "subnet_id" {
  value = "data.azurerm_subnet.tf-sn.id"
}

output "network_interface_ids" {
  value = "[element(azurerm_network_interface.tf-ni.*.id, count.index)]"
}
