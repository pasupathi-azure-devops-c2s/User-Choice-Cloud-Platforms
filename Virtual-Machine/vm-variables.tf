variable "cloud_provider_2" {
    type = string
    description = "Cloud provider for the VM (aws, azure, gcp)"
  
}

variable "resource_name" {
    type = string
    description = "Provide the Resource Name:"
}


variable "subent-cidr" {
    type = string
    description = "Provide the Subnet CIDR Range: "
}


variable "cidr-vnet"{
    type = string
    description = "Provide the VNet CIDR Range:"
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
variable "aws-region-2" {
    description = "Provide the AWS Second region for subents: \n If you provide the main region as 'us-west-1', You need to maintain subnetwork regions like 'us-west-1a', 'us-west1-b', etc..."
    type = string
}
