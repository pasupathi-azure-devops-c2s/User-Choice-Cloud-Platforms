variable "gcp-region"{
    type = string
    description = "Provide the GCP Region detail: "
}

variable "resource-name" {
    type = string
    description = "Provide the Resource Name:"
}

variable "cloud_provider" {
  description = "Cloud provider for the VM (AWS, Azure, GCP)"
  type        = string
}

variable "cloud_platform" {
  description = "Which Deployment Cloud Platform You Need to Provision? \n Like Virtual Machine (or) Kubernetes Service (or) Serverless Engine?"
  
}