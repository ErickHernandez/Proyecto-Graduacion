resource "aws_vpc" "proyectograd-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = {
    Name = "proyectograd-vpc"
  }
}

resource "aws_subnet" "proyectograd-subnet-public-1" {
  vpc_id                  = aws_vpc.proyectograd-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = var.aws_availability_zone_a
  tags = {
    Name = "proyectograd-subnet-public-1"
  }
}

resource "aws_subnet" "proyectograd-subnet-public-2" {
  vpc_id                  = aws_vpc.proyectograd-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = var.aws_availability_zone_b
  tags = {
    Name = "proyectograd-subnet-public-2"
  }
}

resource "aws_db_subnet_group" "db-proyectograd" {
  name       = "db-proyectograd"
  subnet_ids = [aws_subnet.proyectograd-subnet-public-1.id, aws_subnet.proyectograd-subnet-public-2.id]

  tags = {
    Name = "proyectograd-subnet-group"
  }
}