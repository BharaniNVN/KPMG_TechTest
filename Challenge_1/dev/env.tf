module "network"{
    source = "../Modules"

    location = var.location
    resource_group_name = var.resource_group_name
    vnet_name = var.vnet_name
    vnet_address_space = var.vnet_address_space
    frontend_subnet_name = var.frontend_subnet_name
    frontend_subnet_address_space = var.frontend_subnet_address_space
    middleware_subnet_name = var.middleware_subnet_name
    middleware_subnet_address_space = var.middleware_subnet_address_space
    backend_subnet_name = var.backend_subnet_name
    backend_subnet_address_space = var.backend_subnet_address_space
    nsgname = var.nsgname
    destination_address_prefix = var.destination_address_prefix
    nsg_subnet_id = module.network.frontend_subnet
    nsg_id = module.network.nsg

}

locals {
  prefix     = "dev"
  vm_size   = "Standard_DS1_v2"
  subnet1_id = module.network.frontend_subnet
  subnet2_id = module.network.middleware_subnet
  subnet3_id = module.network.backend_subnet
  virtual_machines = {
    "frontend" = { subnet_id = local.subnet1_id },
    "middleware" = { subnet_id = local.subnet2_id },
    "backend" = { subnet_id = local.subnet3_id }
    }
}

module "compute"{
    source = "../Modules"
    for_each = local.virtual_machines

  vm_name   = each.key
  location  = var.location
  vm_size   = each.value.vm_size
  rg_name   = var.resource_group_name
  subnet_id = each.value.subnet_id
  prefix    = local.prefix
  avset_name = "devavset"
  local_username = var.username
  local_password = var.password

  depends_on = [module.network]  

}