variable "resource_name" {
    type = string
    description = "Provide the Azure Kubernetes Cluster Name:"
}

variable "azure-region" {
    description = "Provide the Azure Common Region to provision the Azure resources inside that region: "
    type = string
}