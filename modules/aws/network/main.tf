# Creating a VPC

resource "aws_vpc" "vpc-terraform" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "terraform-vpc"
  }
}

# Creating 4 subnets (2 privates and 2 publics)

# public subnet a
resource "aws_subnet" "sn-a-public" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.vpc-terraform.id
  availability_zone = var.az-a
  map_public_ip_on_launch = true
  tags = {
    Name = "sn-a-public"
  }
}

# private subnet a
resource "aws_subnet" "sn-a-private" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc-terraform.id
  availability_zone = var.az-a
  tags = {
    Name = "sn-a-private"
  }
}

# public subnet b
resource "aws_subnet" "sn-b-public" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.vpc-terraform.id
  availability_zone = var.az-b
  map_public_ip_on_launch = true
  tags = {
    Name = "sn-b-public"
  } 
}

# private subnet b
resource "aws_subnet" "sn-b-private" {
  cidr_block = "10.0.3.0/24"
  vpc_id = aws_vpc.vpc-terraform.id
  availability_zone = var.az-b
  tags = {
    Name = "sn-b-private"
  }  
}

# Creating Internet Gateway
resource "aws_internet_gateway" "ig-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id
  tags = {
    Name = "ig-terraform"
  }
}

# Creating Elastic IP for NAT Gateway
resource "aws_eip" "eip-ng-terraform" {
  vpc = true
  tags = {
    Name = "eip-ng-terraform"
  }
}

# Creating NAT Gateway
resource "aws_nat_gateway" "ng-terraform" {
  allocation_id = aws_eip.eip-ng-terraform.id
  subnet_id = aws_subnet.sn-a-public.id
  depends_on = [aws_internet_gateway.ig-terraform]
  tags = {
    Name = "ng-terraform"
  }
}

# Creating 2 route tables

# public route table
resource "aws_route_table" "rt-public-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-terraform.id
  }
  tags = {
    Name = "rt-public-terraform"
  }
}

# private route table
resource "aws_route_table" "rt-private-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id
  route{
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ng-terraform.id
  }
  tags = {
    Name = "rt-private-terraform"
  }
}

# Associating the Public subnet a to public route table
resource "aws_route_table_association" "rta-a-pub" {
  route_table_id = aws_route_table.rt-public-terraform.id
  subnet_id = aws_subnet.sn-a-public.id
}

# Associating the Public subnet b to public route table
resource "aws_route_table_association" "rta-b-pub" {
  route_table_id = aws_route_table.rt-public-terraform.id
  subnet_id = aws_subnet.sn-b-public.id
}

# Associating the Private subnet a to private route table
resource "aws_route_table_association" "rta-a-priv" {
  route_table_id = aws_route_table.rt-private-terraform.id
  subnet_id = aws_subnet.sn-a-private.id
}

# Associating the Private subnet b to private route table
resource "aws_route_table_association" "rta-b-priv" {
  route_table_id = aws_route_table.rt-private-terraform.id
  subnet_id = aws_subnet.sn-b-private.id
}