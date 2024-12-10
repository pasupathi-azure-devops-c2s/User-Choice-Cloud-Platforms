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

resource "aws_subnet" "serverless-subnet" {
    vpc_id = aws_vpc.serverless-vpc.id
    cidr_block = var.subent-cidr
    availability_zone = "us-west-2a"
    map_public_ip_on_launch = true
  
}

resource "aws_apprunner_service" "name" {
    service_name = var.resource_name

    source_configuration {
      authentication_configuration {
        connection_arn = aws_apprunner_connection.apprunner-connection.arn

      }

      image_repository {
          image_identifier      = aws_ecr_repository.serverless-engine-aws_ecr_repository.repository_url
          image_repository_type = "ECR"  # Specifies that the source is ECR
    }

    }

    network_configuration {
      egress_configuration {
        egress_type = "VPC"
        vpc_connector_arn = aws_apprunner_vpc_connector.vpc-connector.arn
      }
    }
}
