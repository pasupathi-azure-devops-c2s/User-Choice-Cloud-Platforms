module "AWS" {
    source = "./AWS-Cluster"
    count = var.cloud_provider_2 == "AWS" ? 1 : 0
    resource_name = var.resource_name
    aws-region-2 = var.aws-region-2

  
}

module "Azure" {
    source = "./Azure-Cluster"
    count = var.cloud_provider_2 == "Azure" ? 1 : 0
    resource_name = var.resource_name
    azure-region = var.azure-region
  
}

module "GCP" {
    source = "./GCP-Cluster"
    count = var.cloud_provider_2 == "GCP" ? 1 : 0
    resource_name = var.resource_name
    project-id = var.project-id
    gcp-iam-mail-id = var.gcp-iam-mail-id
  
}