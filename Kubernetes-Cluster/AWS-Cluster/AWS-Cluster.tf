resource "aws_iam_role" "eks-full-access" {
  name = "eks-full-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_vpc" "aws-virtual-pc" {
    cidr_block = "10.1.0.0/16"

    tags = {
      Name= "Initial Virtual Private Cloud / Network for AWS EKS Cluster"
    }
    
}

resource "aws_subnet" "aws-subnet" {
    vpc_id = aws_vpc.aws-virtual-pc.id
    cidr_block = "10.1.0.0/24"
    availability_zone = var.aws-region-2

    tags = {
      Name= "AWS Public Subnet"
    }
  
}

resource "aws_ecr_repository" "ecr-01" {
  name = "ecr01sample"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  
}

resource "aws_eks_cluster" "user-choice-eks" {
  name = var.resource_name
  role_arn = aws_iam_role.eks-full-access.arn

  vpc_config {
    subnet_ids = [ aws_subnet.aws-subnet.id ]
  }

  depends_on = [ 
    aws_ecr_repository.ecr-01, 
    aws_iam_role.eks-full-access 
  ]
  
}