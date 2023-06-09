
resource "random_string" "random" {
  length           = 5
  number = true
  special          = false
  override_special = "/@£$"
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic-${random_string.random.result}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.prefix}-ipconfiguration-${random_string.random.result}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.prefix}-${var.vm_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.vm_size
  availability_set_id = azurerm_availability_set.vm_avset.id

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-osdisk-${random_string.random.result}"
    create_option     = "FromImage"
  }

  os_profile {
    computer_name  = "${var.prefix}-${var.vm_name}"
    admin_username = var.local_username
    admin_password = var.local_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  depends_on = [azurerm_availability_set.vm_avset]

}

resource "azurerm_availability_set" "vm_avset" {
  name                = var.avset_name
  location            = var.location
  resource_group_name = var.resource_group_name
}