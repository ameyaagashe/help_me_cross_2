resource "azurerm_network_security_group" "tf-nsg" {
  name                = var.app_nsg
  location            = module.resourcegroup.external_rg_location
  resource_group_name = module.resourcegroup.external_rg_name

security_rule {

  name                        = "Open Port 3389 & 5986"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389,5986"
  source_address_prefixes     = var.allowed_source_ips
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.resourcegroup.external_rg_name
  network_security_group_name = azurerm_network_security_group.tf-nsg.name
}

}
# Assosciate NSG to subnet
resource "azurerm_subnet_network_security_group_association" "tf-snnsg" {
  subnet_id                 = module.network.subnet_id[0]
  network_security_group_id = azurerm_network_security_group.tf-nsg.id
}