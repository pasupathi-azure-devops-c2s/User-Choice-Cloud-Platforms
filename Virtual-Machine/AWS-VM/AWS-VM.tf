resource "aws_vpc" "aws-virtual-pc" {
    cidr_block = "10.1.0.0/16"

    tags = {
      Name= "Initial Virtual Private Cloud / Network for AWS Instance"
    }
    
}

resource "aws_subnet" "aws-subnet" {
    vpc_id = aws_vpc.aws-virtual-pc.id
    cidr_block = "10.1.0.0/24"
    availability_zone = "us-west-2a"

    tags = {
      Name= "AWS Public Subnet"
    }
  
}

resource "aws_security_group" "aws-nsg" {
    vpc_id = aws_vpc.aws-virtual-pc.id

    name = "AWS-Network-Security-Group"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    egress {
        from_port   = 0          # Allow all outbound traffic
        to_port     = 0
        protocol    = "-1"       # -1 means all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_key_pair" "public_key" {
    key_name = "Public-Key"
    public_key = file("${path.module}/id_key.pub")
  
}

resource "aws_instance" "ubuntu-vm" {
    ami = "ami-0dee22c13ea7a9a67"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.aws-subnet.id
    security_groups = [aws_security_group.aws-nsg.name]
    key_name = aws_key_pair.public_key.key_name

  
}

resource "aws_eip" "public-ip" {
    instance = aws_instance.ubuntu-vm.id
  
}