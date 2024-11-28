variable "gcp-region"{
    type = string
    description = "Provide the GCP Region detail: "
}

variable "resource-name" {
    type = string
    description = "Provide the Instance, Kubernetes Cluster or Serverless Engine Name:"
}

variable "cloud_provider" {
  description = "Cloud provider for the VM (AWS, Azure, GCP)"
  type        = string
}