module "Virtual-Machine" {
    source = "./Virtual-Machine"
    count  = var.cloud_provider_1 == "Virtual-Machine" ? 1 : 0
    cloud_provider_2= var.cloud_provider_2
    resource_name= var.resource_name
  
}

module "Kubernetes" {
    source = "./Kubernetes-Cluster"
    count  = var.cloud_provider_1 == "Kubernetes" ? 1 : 0
    cloud_provider_2 = var.cloud_provider_2
    resource_name= var.resource_name
  
}

module "Serverless-Engine" {
    source = "./Serverless-Engine"
    count  = var.cloud_provider_1 == "Serverless-Engine" ? 1 : 0
    cloud_provider_2= var.cloud_provider_2
    resource_name= var.resource_name
  
}

