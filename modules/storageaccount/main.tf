# Storage Account
resource "azurerm_storage_account" "tf-sa" {
  count                    = var.vm_count
  name                     = "${lower(var.base_hostname)}${format("%02d", count.index + 1)}${var.sto_acc_suffix}01"
  location                 = data.azurerm_virtual_network.tf-vn.location
  resource_group_name      = data.azurerm_resource_group.tf-rg-external.name
  account_tier             = var.sto_acc_tier_std
  account_replication_type = var.sto_acc_rep_type_lrs
}