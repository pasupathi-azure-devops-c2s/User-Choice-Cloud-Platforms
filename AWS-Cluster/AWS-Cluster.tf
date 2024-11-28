resource "aws_vpc" "aws-virtual-pc" {
    cidr_block = "10.1.0.0/16"

    tags = {
      Name= "AWS-EKS-VPC-01"
    }
    
}

resource "aws_internet_gateway" "eks-public-gateway" {
  vpc_id = aws_vpc.aws-virtual-pc.id

  tags = {
    Name = "EKS-Public-Gateway-01"
  }

}

resource "aws_security_group" "eks-nsg" {
  vpc_id = aws_vpc.aws-virtual-pc.id

  tags = {
    Name = "AWS-NSG-01"
  }
}

resource "aws_ecr_repository" "aws-ecr" {
  name = "ecr01sample"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  
}


