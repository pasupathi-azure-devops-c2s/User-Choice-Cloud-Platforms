variable "cloud_provider_2" {
    type = string
    description = "Cloud provider for the VM (aws, azure, gcp)"
  
}

variable "resource_name" {
    type = string
    description = "Provide the Resource Name:"
}


variable "project-id" {
    type = string
    description = "Provide the GCP Project ID: "
  
}

variable "azure-region" {
    description = "Provide the Azure Common Region to provision the Azure resources inside that region: "
    type = string
}