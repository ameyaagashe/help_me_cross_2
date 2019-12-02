# Declaring various resources
###################################################################################################
#                   Standard for Declaring Terraform Internal Variables
###################################################################################################
# tf-{abbreviated resource type}-{abbreviated product name}-{abbreviated application name}-{abbreviated appp flavour}}
# rg   - Resource Group
# vn   - Virtual Network
# sn   - Subnet
# ni   - Network interface
# sa   - Storage Account
# vm   - Virtual Machine
# mdsk - Managed Disk
# as   - Availability Set
# pubip - Public IP

###################################################################################################
#
###################################################################################################

# Reference existing resource group for Virtual Network

resource "azurerm_virtual_machine" "tf-vm" {
  count                            = var.vm_count
  name                             = "${var.base_hostname}${format("%02d", count.index + 1)}"
  location                         = module.resourcegroup.external_rg_location
  resource_group_name              = module.resourcegroup.external_rg_name
  network_interface_ids            = [element(module.network.network_interface_ids,count.index)]
  vm_size                          = var.vm_size

  delete_os_disk_on_termination    = true

  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher                      = var.vm_publisher
    offer                          = var.vm_offer
    sku                            = var.vm_sku
    version                        = var.vm_img_version
  }

  storage_os_disk {
    name                           = "${var.base_hostname}${format("%02d", count.index + 1)}-wosdsk01"
    caching                        = var.caching_option
    create_option                  = var.create_option
    managed_disk_type              = var.managed_disk_std_lrs
  }

  os_profile {
    computer_name                  = "${var.base_hostname}${format("%02d", count.index + 1)}"
    admin_username                 = var.username
    admin_password                 = var.password
  }

  os_profile_windows_config {
    enable_automatic_upgrades      = false
    provision_vm_agent             = "true"
  }
}
