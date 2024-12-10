resource "azurerm_resource_group" "serverless-engine-rg" {
    name = "Serverless-Engine-RG"
    location = "eastus"
  
}

resource "azurerm_log_analytics_workspace" "workspace-01" {
    name = "Log-Analystics-WorkSpace-01"
    location = azurerm_resource_group.serverless-engine-rg.location
    resource_group_name = azurerm_resource_group.serverless-engine-rg.name
    sku = "PerGB2018"
    retention_in_days = 30
  
}

resource "azurerm_container_app_environment" "app-environment-01" {
    name = "Serverless-Environment-01"
    resource_group_name = azurerm_resource_group.serverless-engine-rg.name
    location = azurerm_resource_group.serverless-engine-rg.location
    log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace-01.id

  
}

resource "azurerm_container_app" "container-app-01" {
    name = var.resource_name
    resource_group_name = azurerm_resource_group.serverless-engine-rg.name
    container_app_environment_id = azurerm_container_app_environment.app-environment-01.id
    revision_mode = "Single"

    

    template {
      container {
        name = "initcontainerapps"
        image = "mcr.microsoft.com/k8se/quickstart:latest"
        cpu = 0.25
        memory = "0.5Gi"
      }
    }
  
}
