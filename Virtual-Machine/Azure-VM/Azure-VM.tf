resource "azurerm_resource_group" "azure-vm-rg" {
    name = "Azure-VM-RG"
    location = "eastus"
  
}

resource "azurerm_virtual_network" "azure-vnet" {
    name = "Azure-VNet-01"
    resource_group_name = azurerm_resource_group.azure-vm-rg.name
    location = azurerm_resource_group.azure-vm-rg.location
    address_space = [ "10.0.0.0/16" ]
  
}

resource "azurerm_subnet" "azure-subnet" {
    name = "Azure-Subnet-01"
    resource_group_name = azurerm_resource_group.azure-vm-rg.name
    virtual_network_name = azurerm_virtual_network.azure-vnet.name
    address_prefixes = [ "10.0.0.0/24" ]
  
}

resource "azurerm_public_ip" "vm-public-ip" {
    name = "VM-Public-IP"
    resource_group_name = azurerm_resource_group.azure-vm-rg.name
    location = azurerm_resource_group.azure-vm-rg.location
    allocation_method = "Static"
  
}

