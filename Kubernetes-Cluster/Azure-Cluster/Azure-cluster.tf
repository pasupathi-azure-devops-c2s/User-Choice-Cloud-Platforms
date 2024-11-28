
#AKS Cluster Code
resource "azurerm_resource_group" "aks-rg" {
    name = "AKS-Cluster-RG"
    location = "eastus"  
}
resource "azurerm_container_registry" "aks-cr" {
    name = "akscr01sample"
    location = azurerm_resource_group.aks-rg.location
    resource_group_name = azurerm_resource_group.aks-rg.name
    sku = "Basic"
    admin_enabled = true 
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
    name = var.resource-name
    location = azurerm_resource_group.aks-rg.location
    resource_group_name = azurerm_resource_group.aks-rg.name
    dns_prefix = "exampleaks01"
    private_cluster_enabled = false

    default_node_pool {
      name = "default"
      node_count = 3
      vm_size = "Standard_D2_v2"
    }
    
    identity {
      type = "SystemAssigned"
    } 
       
}

resource "azurerm_role_assignment" "acr-role" {
  principal_id = azurerm_kubernetes_cluster.aks-cluster.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope = azurerm_container_registry.aks-cr.id
  
}
