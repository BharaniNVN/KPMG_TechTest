output "rg_name"{
  value = azurerm_resource_group.aks_rg.name
}

output "vnet"{
  value = azurerm_virtual_network.vnet.id
}

output "frontend_subnet"{
  value = azurerm_subnet.frontend.id
}

output "frontend_subnet_address_prefix"{
  value = azurerm_subnet.frontend[0].address_prefix
}

output "middleware_subnet"{
  value = azurerm_subnet.middleware.id
}

output "backend_subnet"{
  value = azurerm_subnet.backend.id
}

output "nsg"{
  value = azurerm_network_security_group.nsg.id
}


output "vm_id" {
  value = azurerm_virtual_machine.vm[*].id
}

output "vm_name" {
  value = azurerm_virtual_machine.vm[*].name
}