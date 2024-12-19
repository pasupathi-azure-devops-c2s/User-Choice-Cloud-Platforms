variable "resource_name" {
    type = string
    description = "Provide the GCP Kubernetes Cluster Name:"
}

variable "project-id" {
    type = string
    description = "Provide the GCP Project ID: "
  
}

variable "gcp-iam-mail-id" {
    description = "Provide the Mail-ID to create the GCP IAM role: "
    type = string
  
}