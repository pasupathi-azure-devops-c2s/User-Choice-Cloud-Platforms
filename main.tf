module "Azure" {
    source = "./Azure-Kuberenetes-Cluster"
    count  = var.cloud_provider == "Azure" ? 1 : 0
    resource-name = var.resource-name
  
}

module "AWS" {
    source = "./AWS-Cluster"
    count  = var.cloud_provider == "AWS" ? 1 : 0
    resource-name = var.resource-name
  
}

module "GCP" {
    source = "./GCP-Cluster"
    count  = var.cloud_provider == "GCP" ? 1 : 0
    resource-name = var.resource-name
  
}

