variable "gcp-region"{
    type = string
    description = "Provide the GCP Region detail: "
    default = "us-central1"
}
variable "aws-region"{
    type = string
    description = "Provide the AWS Region detail: "
    default = "us-west-1"
   
}

variable "azure-region" {
    description = "Provide the Azure Common Region to provision the Azure resources inside that region: "
    type = string
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
    #default = "userchoice01se"
}

variable "cloud_provider_2" {
  description = "Cloud provider for the VM (AWS, Azure, GCP)"
  type        = string
  #default = "GCP"
}

variable "cloud_provider_1" {
  description = "Which Deployment Cloud Platform You Need to Provision? \n Like Virtual Machine (or) Kubernetes Service (or) Serverless Engine?"
  type = string
  #default = "Kubernetes"
  
}

variable "admin_username" {
    description = "Provide the Admin Username to provision the resource based on your username: "
    type = string
}

variable "aws-region-2" {
    description = "Provide the AWS Second region for subents: \n If you provide the main region as 'us-west-1', You need to maintain subnetwork regions like 'us-west-1a', 'us-west1-b', etc..."
    type = string
}

variable "aws-region-3" {
    description = "Provide the AWS Third region for another subnets: \n If you provide the main region as 'us-west-1', You need to maintain subnetwork regions like 'us-west-1a', 'us-west1-b', etc..."
    type = string
}

variable "gcp-region-2" {
    description = "Provide the GCP Second region based on the main GCP Region: \n If you provide the main region as 'us-west-1', You need to maintain subnetwork regions like 'us-west-1a', 'us-west1-b', etc..."
    type = string
}

variable "gcp-iam-mail-id" {
    description = "Provide the Mail-ID to create the GCP IAM role: "
    type = string
  
}