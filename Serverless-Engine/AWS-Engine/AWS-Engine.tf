resource "aws_ecr_repository" "serverless-engine-aws_ecr_repository" {
    name = "secr01sample"
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
      scan_on_push = true
    }
  
}

resource "aws_iam_role" "app_runner_build_role" {
  name = "app-runner-build-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "build.apprunner.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "test_policy" {
  name = "ecr_pull_policy"
  role = aws_iam_role.app_runner_build_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:DescribeImages",
        "ecr:GetAuthorizationToken"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}


resource "aws_security_group" "aws-nsg" {
  name_prefix = "application-nsg"
  vpc_id      = aws_vpc.serverless-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
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

resource "aws_apprunner_vpc_connector" "vpc_connector" {
  vpc_connector_name = "vpc-connector-01"
  subnets = [aws_subnet.serverless-subnet.id]
  security_groups = [ aws_security_group.aws-nsg.id ]
  
}

resource "aws_secretsmanager_secret" "docker_hub_credentials" {
  name = "docker-hub-credentials"

  description = "Docker Hub credentials for App Runner authentication"
}

resource "aws_secretsmanager_secret_version" "docker_hub_secret_version" {
  secret_id     = aws_secretsmanager_secret.docker_hub_credentials.id
  secret_string = jsonencode({
    username = "pasupathikumar819",
    password = "NewPassword@1234"
  })
}

resource "aws_apprunner_connection" "docker-connection" {
  connection_name = "docker-hub-connection"

  
  provider_type = "GITHUB" 
}

resource "aws_apprunner_service" "name" {
    service_name = var.resource_name

    source_configuration {
      authentication_configuration {
      connection_arn = aws_apprunner_connection.docker-connection.arn
    }

      image_repository {
          image_identifier      = "pasupathikumar819/pasupathikumar-portfolio:latest"
          image_repository_type = "DOCKER"  # Specifies that the source is ECR
    }

    }

    network_configuration {
      egress_configuration {
        egress_type = "VPC"
        vpc_connector_arn = aws_apprunner_vpc_connector.vpc_connector.arn
      }
    }
}
