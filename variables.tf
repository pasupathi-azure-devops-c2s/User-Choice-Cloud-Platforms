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
}


variable "cidr-vnet"{
    type = string
    description = "Provide the VNet CIDR Range:"
}

variable "resource_name" {
    type = string
    description = "Provide the Resource Name:"
}

variable "cloud_provider_2" {
  description = "Cloud provider for the VM (AWS, Azure, GCP)"
  type        = string
}

variable "cloud_provider_1" {
  description = "Which Deployment Cloud Platform You Need to Provision? \n Like Virtual Machine (or) Kubernetes Service (or) Serverless Engine?"
  
}

variable "azure-key-vault-resource-group" {
  type = string
  description = "Please provide our given Azure Key Vault Resource Group Name:"
  
}

variable "key-vault" {
  type = string
  description = "Please provide our Azure Key Vault Name for access our secrets:"
  
}
variable "azure-subscription-id" {
  type = string
  description = "Please provide the given Secret name for access your Azure Subscription ID: "
  
}

variable "azure-tenant-id" {
  type = string
  description = "Please provide the given Secret name for access your Azure Tenant ID: "
  
}

variable "azure-client-id" {
  type = string
  description = "Please provide the given Secret name for access your Azure client ID: "
  
}

variable "azure-client-secret-id" {
  type = string
  description = "Please provide the given Secret name for access your Azure Client Secret Value or ID: "
  
}

variable "aws-access-key-id" {
  type = string
  description = "Please provide the given Secret name for access your AWS Access Key ID: "
  
}

variable "aws-secret-access-key" {
  type = string
  description = "Please provide the given secret name for access your AWS Secret Access Key"
  
}

variable "google-project-id" {
  type = string
  description = "Please provide the given secret name for acces your Google Project ID: "
  
}

variable "google-credential-file-url" {
  type = string
  description = "Please provide the given secret name (or) public url (or) physical file path for access your Google Credential file"
  
}
