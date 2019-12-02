output "external_rg_name" {
  value = "${data.azurerm_resource_group.tf-rg-external.name}"
}
output "external_rg_location" {
  value = "${data.azurerm_resource_group.tf-rg-external.location}"
}