module "sql_vms" {
  source                = "../../modules/compute/"
  #rg_name              = var.resource_group_name
  #vnet_name            = var.virtual_network_name
  #subnet_name          = var.sql_subnet_name
  #app_nsg              = var.application_nsg
  vm_count              = var.count_vm
  base_hostname         = var.sql_host_basename
  vm_size               = var.virtual_machine_size
  vm_publisher          = var.virtual_machine_image_publisher
  vm_offer              = var.virtual_machine_image_offer
  vm_sku                = var.virtual_machine_image_sku
  vm_img_version        = var.virtual_machine_image_version
  username              = var.username
  password              = var.password
  #allowed_source_ips   = var.ip_list
  #network_interface_ids = [element(module.network.network_interface_ids, count.index)]
}
module "resource_group" {
  source                = "../../modules/resourcegroup/"
  #rg_name               = "test_rg"
}
module "networking" {
  source                = "../../modules/network"
  rg_name               = "test_rg"
  vnet_name             = "virtual_network_1"
  subnet_name           = "subnet_1"
}
module "network_security_group" {
  source                = "../../modules/nsg"
  app_nsg               = "application_nsg" 
  allowed_source_ips    = var.ip_list
}




# Perhaps need a loop to create a variety of roles of VM like tomcat machine, IIS etc
# module "vm_app" {
#   source             = "../../modules/create_vm/"
#   rg_name            = var.resource_group_name
#   vnet_name          = var.virtual_network_name
#   subnet_name        = var.app_subnet_name
#   app_nsg            = var.application_nsg
#   vm_count           = var.count_vm
#   base_hostname      = var.app_host_basename
#   sto_acc_suffix     = var.storage_account_suffix
#   vm_size            = var.virtual_machine_size
#   vm_publisher       = var.virtual_machine_image_publisher
#   vm_offer           = var.virtual_machine_image_offer
#   vm_sku             = var.virtual_machine_image_sku
#   vm_img_version     = var.virtual_machine_image_version
#   username           = var.username
#   password           = var.password
#   allowed_source_ips = var.ip_list
# }
