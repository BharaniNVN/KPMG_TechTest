
## Azure VNET's & SUBNETS
resource "azurerm_resource_group" "aks_rg" {

  location = var.location
  name     = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name
   resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  address_space       = [var.vnet_address_space]
}

resource "azurerm_subnet" "frontend" {
  name                 = var.frontend_subnet_name
  resource_group_name = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.frontend_subnet_address_space]
}

resource "azurerm_subnet" "middleware" {
  name                 = var.middleware_subnet_name
  resource_group_name = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.middleware_subnet_address_space]
}

resource "azurerm_subnet" "backend" {
  name                 = var.backend_subnet_name
  resource_group_name = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.backend_subnet_address_space]
}

## NSG's

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "webtraffic"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = [var.destination_address_prefix]
  }

  tags = {
    environment = "demo"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-frontend" {
  subnet_id                 = var.nsg_subnet_id
  network_security_group_id = var.nsg_id
}

