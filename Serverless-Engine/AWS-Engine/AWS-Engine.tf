resource "aws_ecr_repository" "serverless-engine-aws_ecr_repository" {
    name = "secr01sample"
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
      scan_on_push = true
    }
  
}

resource "aws_vpc" "serverless-vpc" {
    cidr_block= var.cidr-vnet

    tags = {
        Name = "Serverless-VPC"

    }  
  
}

resource "aws_apprunner_service" "name" {
  
}
