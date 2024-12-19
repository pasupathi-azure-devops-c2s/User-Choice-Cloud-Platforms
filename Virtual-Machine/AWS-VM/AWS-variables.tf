variable "resource_name" {
    type = string
    description = "Provide the AWS Kubernetes Cluster Name:"
}

variable "aws-region-2" {
    description = "Provide the AWS Second region for subents: \n If you provide the main region as 'us-west-1', You need to maintain subnetwork regions like 'us-west-1a', 'us-west1-b', etc..."
    type = string
}
