
resource "azurerm_network_interface" "tf-ni" {
  count                           = var.vm_count
  name                            = "${var.base_hostname}${format("%02d", count.index + 1)}-nic01"
  location                        = data.azurerm_virtual_network.tf-vn.location
  resource_group_name             = data.azurerm_resource_group.tf-rg-external.name

  ip_configuration {
    name                          = "${var.base_hostname}${format("%02d", count.index)}-iip01"
    subnet_id                     = data.azurerm_subnet.tf-sn.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = element(azurerm_public_ip.tf-pip.*.id, count.index)
  }
}

resource "azurerm_public_ip" "tf-pip" {
  count                           = var.vm_count
  location                        = data.azurerm_virtual_network.tf-vn.location
  name                            = "${var.base_hostname}${format("%02d", count.index + 1)}-pip01"
  resource_group_name             = data.azurerm_resource_group.tf-rg-external.name
  allocation_method               = "Dynamic"
}