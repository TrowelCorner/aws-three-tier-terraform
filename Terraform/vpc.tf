#Create the VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  tags = {
    Name = "3-tier-vpc"
  }
}

#Fetch availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

#Create Internet Gateway
resource "aws_internet_gateway" "igw" {   
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

#Create Public Subnets (Web Tier)
resource "aws_subnet" "public" {
  count = 2
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}