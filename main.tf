module "Virtual-Machine" {
    source = "./Virtual-Machine"
    count  = var.cloud_provider_1 == "Virtual-Machine" ? 1 : 0
    cloud_provider_2= var.cloud_provider_2
    resource_name= var.resource_name
    cidr-vnet = var.cidr-vnet
    subent-cidr = var.subent-cidr
    azure-region = var.azure-region
    
  
}

module "Kubernetes" {
    source = "./Kubernetes-Cluster"
    count  = var.cloud_provider_1 == "Kubernetes" ? 1 : 0
    cloud_provider_2 = var.cloud_provider_2
    resource_name= var.resource_name
    project-id= data.azurerm_key_vault_secret.google_project_id.value
    azure-region = var.azure-region
    #project-id = data.azurerm_key_vault_secret.google-project-name

  
}

module "Serverless-Engine" {
    source = "./Serverless-Engine"
    count  = var.cloud_provider_1 == "Serverless-Engine" ? 1 : 0
    cloud_provider_2= var.cloud_provider_2
    resource_name= var.resource_name
    cidr-vnet = var.cidr-vnet
    subent-cidr = var.subent-cidr
    project-id = data.azurerm_key_vault_secret.google_project_id.value
    gcp-region = var.gcp-region
    azure-region = var.azure-region
  
}

