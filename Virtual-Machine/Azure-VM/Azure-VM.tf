resource "azurerm_resource_group" "azure-vm-rg" {
    name = "Azure-VM-RG"
    location = "eastus"
  
}

resource "azurerm_virtual_network" "azure-vnet" {
    name = "Azure-VNet-01"
    resource_group_name = azurerm_resource_group.azure-vm-rg.name
    location = azurerm_resource_group.azure-vm-rg.location
    address_space = [ var.cidr-vnet ]
  
}

resource "azurerm_subnet" "azure-subnet" {
    name = "Azure-Subnet-01"
    resource_group_name = azurerm_resource_group.azure-vm-rg.name
    virtual_network_name = azurerm_virtual_network.azure-vnet.name
    address_prefixes = [ var.subent-cidr ]
  
}

resource "azurerm_public_ip" "vm-public-ip" {
    name = "VM-Public-IP"
    resource_group_name = azurerm_resource_group.azure-vm-rg.name
    location = azurerm_resource_group.azure-vm-rg.location
    allocation_method = "Static"
  
}

resource "azurerm_network_security_group" "azure-nsg-01" {
    name = "Azure-NSG-01"
    resource_group_name = azurerm_resource_group.azure-vm-rg.name
    location = azurerm_resource_group.azure-vm-rg.location

    #Add the Inbound and Outbound Security rules based on your requirement.
  
}

resource "azurerm_network_interface" "azure-interface" {
    name = "Ubuntu-Internal-IP"
    resource_group_name = azurerm_resource_group.azure-vm-rg.name
    location = azurerm_resource_group.azure-vm-rg.location

    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.azure-subnet.id
      public_ip_address_id = azurerm_public_ip.vm-public-ip.id
      private_ip_address_allocation = "Dynamic"
    }
  
}

resource "azurerm_linux_virtual_machine" "ubuntu-vm" {
    name = var.resource_name
    location = azurerm_resource_group.azure-vm-rg.location
    resource_group_name = azurerm_resource_group.azure-vm-rg.name
    size = "Standard_DS1_v2"

    admin_username = "Pasupathikumar"
    admin_password = "NewPassword@1234"
    disable_password_authentication = false

    network_interface_ids = [azurerm_network_interface.azure-interface.id]

    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "Canonical"
      offer = "UbuntuServer"
      sku = "18.04-LTS"
      version = "latest"
    }
  
}