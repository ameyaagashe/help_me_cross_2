#Introduction
This wiki contains guidance on how to use terraform scripts contained within.

# Using Existing Scripts.
Please follow the below pattern to create new terraform config
terraform/<subscription>/<terraform configuration files>

When you create a new subscription folder, please use the code from Modules. If the module is not existing, please create relevant module or requets one to be created.

# How to refrence a Module in terraform config?
Check the code below as an example:
```
module "vm_app" {
  source            = "../Modules/create_vm"
  rg_name           = "${var.resource_group_name}"
  vnet_name         = "${var.virtual_network_name}"
  subnet_name       = "${var.app_subnet_name}"
  app_nsg           = "${var.application_nsg}"
  vm_count          = "${var.count_vm}"
  base_hostname     = "${var.app_host_basename}"
  sto_acc_suffix    = "${var.storage_account_suffix}"
  vm_size           = "${var.virtual_machine_size}"
  vm_publisher      = "${var.virtual_machine_image_publisher}"
  vm_offer          = "${var.virtual_machine_image_offer}"
  vm_sku            = "${var.virtual_machine_image_sku}"
  vm_img_version    = "${var.virtual_machine_image_version}"
  username          = "${var.username}"
  password          = "${var.password}"

}
```
The above configuration, shall create app virtual machines.


