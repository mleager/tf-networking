resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "VPC"
    Environment = var.env
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_cidr)

  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr[count.index]

  availability_zone = var.public_availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name        = "Public ${count.index}"
    Environment = var.env
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_cidr)

  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr[count.index]

  availability_zone = var.public_availability_zones[count.index]

  tags = {
    Name        = "Private ${count.index}"
    Environment = var.env
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "Internet Gateway"
    Environment = var.env
  }
}

resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name        = "EIP"
    Environment = var.env
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name        = "NAT Gateway"
    Environment = var.env
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "Public RT"
    Environment = var.env
  }

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name        = "Private RT"
    Environment = var.env
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public_cidr)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_cidr)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

