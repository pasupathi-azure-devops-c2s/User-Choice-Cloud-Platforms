resource "aws_ecr_repository" "serverless-engine-aws_ecr_repository" {
    name = "secr01sample"
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
      scan_on_push = true
    }
  
}

resource "aws_iam_role" "app_runner_build_role" {
  name = "app-runner-build-role"
  assume_role_policy = jsondecode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "build.apprunner.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  
}

resource "aws_iam_role_policy" "test_policy" {
  name = "ecr_pull_policy"
  role = aws_iam_role.app_runner_build_role.id

  policy = jsondecode({
    Version = "2012-10-17"
    Statement = [
      {
      Effect = "Allow"
      Action = [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:DescribeImages",
        "ecr:GetAuthorizationToken"
      ]
      Resource = "*"
      }
    ]
  })
  
}

resource "aws_security_group" "aws-nsg" {
  name_prefix = "application-nsg"
  vpc_id = aws_vpc.serverless-vpc.id
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

resource "aws_apprunner_vpc_connector" "vpc_connector" {
  vpc_connector_name = "vpc-connector-01"
  subnets = [aws_subnet.serverless-subnet.id]
  security_groups = [ aws_security_group.aws-nsg.id ]
  
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
        vpc_connector_arn = aws_apprunner_vpc_connector.vpc_connector.arn
      }
    }
}
