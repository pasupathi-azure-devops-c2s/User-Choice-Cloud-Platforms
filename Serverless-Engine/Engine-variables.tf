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
