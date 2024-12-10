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

