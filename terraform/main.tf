provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "corpVPC" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "CorpVPC"
    Environment = "Production"
  }
}

resource "aws_subnet" "corpSubnetA" {
  vpc_id     = aws_vpc.corpVPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "CorpSubnetA"
    Environment = "Production"
  }
}

resource "aws_security_group" "corpWebSG" {
  vpc_id = aws_vpc.corpVPC.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "CorpWebSG"
    Environment = "Production"
  }
}

resource "aws_instance" "corpWebServer" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.corpSubnetA.id
  vpc_security_group_ids = [aws_security_group.corpWebSG.id]

  tags = {
    Name = "CorpWebServer"
    Environment = "Production"
  }
}