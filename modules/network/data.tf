
# Reference existing Virtual Network
data "azurerm_virtual_network" "tf-vn" {
  name                 = var.vnet_name
  resource_group_name  = module.resource_groups.external_rg_name
}

# Reference existing subnet
data "azurerm_subnet" "tf-sn" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.tf-vn.name
  resource_group_name  = module.resource_groups.external_rg_name
}