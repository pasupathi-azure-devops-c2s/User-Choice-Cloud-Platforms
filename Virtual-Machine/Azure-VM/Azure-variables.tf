variable "resource_name" {
    type = string
    description = "Provide the AWS Kubernetes Cluster Name:"
}

variable "cidr-vnet"{
    type = string
    description = "Provide the VNet CIDR Range:"
}

variable "subent-cidr" {
    type = string
    description = "Provide the Subnet CIDR Range: "
}

variable "azure-region" {
    description = "Provide the Azure Common Region to provision the Azure resources inside that region: "
    type = string
}

variable "admin_username" {
    description = "Provide the Admin Username to provision the resource based on your username: "
    type = string
}

variable "azure-admin-password" {
    description = "Provide the Admin User Password to provision the resource based on your user password: "
    type = string
  
}