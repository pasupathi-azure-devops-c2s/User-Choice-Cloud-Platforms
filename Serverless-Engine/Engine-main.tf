module "AWS" {
    source = "./AWS-Engine"
    count = var.cloud_provider_2 == "AWS" ? 1 : 0
    resource_name = var.resource_name
    cidr-vnet = var.cidr-vnet
    subent-cidr = var.subent-cidr
    aws-region-2 = var.aws-region-2
    
  
}

module "Azure" {
    source = "./Azure-Engine"
    count = var.cloud_provider_2 == "Azure" ? 1 : 0
    resource_name = var.resource_name  
    cidr-vnet = var.cidr-vnet
    subent-cidr = var.subent-cidr
    azure-region = var.azure-region
    
}

module "GCP" {
    source = "./GCP-Engine"
    count = var.cloud_provider_2 == "GCP" ? 1 : 0
    resource_name = var.resource_name
    project-id = var.project-id
    gcp-region = var.gcp-region
}

