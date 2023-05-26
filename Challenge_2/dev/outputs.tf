output "frontend_subnet"{
  value = module.network.frontend_subnet
}

output "middleware_ubnet"{
  value = module.network.middleware_subnet
}

output "backend_subnet"{
  value = module.network.backend_subnet
}

output "frontend_subnet_address_prefix"{
  value = module.network.frontend_subnet_address_prefix
}

output "nsg"{
  value = module.network.nsg
}