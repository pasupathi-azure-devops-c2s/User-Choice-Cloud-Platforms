variable "gcp-region"{
    type = string
    description = "Provide the GCP Region detail: "
    default = "us-central1"
}
variable "aws-region"{
    type = string
    description = "Provide the AWS Region detail: "
    default = "us-west1"
   
}

variable "subent-cidr" {
    type = string
    description = "Provide the Subnet CIDR Range: "
    default = "10.0.0.0/24"
}


variable "cidr-vnet"{
    type = string
    description = "Provide the VNet CIDR Range:"
    default = "10.0.0.0/16"
}

variable "resource_name" {
    type = string
    description = "Provide the Resource Name:"
    default = "User-Choice-SE-01"
}

variable "cloud_provider_2" {
  description = "Cloud provider for the VM (AWS, Azure, GCP)"
  type        = string
  default = "AWS"
}

variable "cloud_provider_1" {
  description = "Which Deployment Cloud Platform You Need to Provision? \n Like Virtual Machine (or) Kubernetes Service (or) Serverless Engine?"
  type = string
  default = "Serverless-Engine"
  
}
