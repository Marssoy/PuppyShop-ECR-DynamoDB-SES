terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.76.0"
    }
  }
}

resource "aws_vpc" "puppyshop_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "PuppyShop-vpc"
  }
}

resource "aws_subnet" "puppyshop_subnet_public" {
  vpc_id = aws_vpc.puppyshop_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "PuppyShop-subnet-public"
  }
}

resource "aws_internet_gateway" "puppyshop_igw" {
  vpc_id = aws_vpc.puppyshop_vpc.id
  tags = {
    Name = "PuppyShop-igw"
  }
}

resource "aws_route_table" "puppyshop_route_table_public" {
  vpc_id = aws_vpc.puppyshop_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.puppyshop_igw.id
  }
  tags = {
    Name = "PuppyShop-rt-public"
  }
}

resource "aws_route_table_association" "rt_public" {
  subnet_id = aws_subnet.puppyshop_subnet_public.id
  route_table_id = aws_route_table.puppyshop_route_table_public.id
}

resource "aws_security_group" "puppyshop_igw_sg" {
  name = "PuppyShop-sg"
  vpc_id = aws_vpc.puppyshop_vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port  = 0
    protocol = "-1"  # -1 significa todos os protocolos
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "PuppyShop-sg"
  }
}

resource "aws_dynamodb_table" "puppy_orders" {
    name = "PuppyOrders"
    billing_mode = "PROVISIONED"
    read_capacity = 5
    write_capacity = 5
    hash_key = "OrderID"

    attribute {
        name = "OrderID"
        type = "S"
    }
}