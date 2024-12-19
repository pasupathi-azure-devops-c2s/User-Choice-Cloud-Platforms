variable "cloud_provider_2" {
    type = string
    description = "Cloud provider for the VM (aws, azure, gcp)"
    
  
}

variable "resource_name" {
    type = string
    description = "Provide the Resource Name:"
}

variable "cidr-vnet"{
    type = string
    description = "Provide the VNet CIDR Range:"
}

variable "subent-cidr" {
    type = string
    description = "Provide the Subnet CIDR Range: "
}

variable "project-id" {
    type = string
    description = "Provide the GCP Project ID: "
  
}

variable "gcp-region"{
    type = string
    description = "Provide the GCP Region detail: "

}

variable "azure-region" {
    description = "Provide the Azure Common Region to provision the Azure resources inside that region: "
    type = string
}