# VPC 
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enabled_dns_support
  enable_dns_hostnames = var.enabled_dns_hostnames
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_vpc"
    }
  )
}

# Public Subnets
resource "aws_subnet" "public_subnet" {
  count             = length(var.subnet_azs)
  vpc_id            = aws_vpc.vpc
  cidr_block        = element(var.pub_cidr_subnet, count.index)
  availability_zone = element(var.subnet_azs, count.index)
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}-infra-${element(var.name_list, count.index)}-pubsub-${count.index + 1}"
    }
  )
}

# Private Subnets
resource "aws_subnet" "private_subnet" {
  count             = length(var.subnet_azs)
  vpc_id            = aws_vpc.vpc
  cidr_block        = element(var.priv_cidr_subnet, count.index)
  availability_zone = element(var.subnet_azs, count.index)
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}-infra-${element(var.name_list, count.index)}-privsub-00${count.index + 1}"
    }
  )
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_igw"
    }
  )
}

# Public Route Table
resource "aws_route_table" "pub_rtb" {
  vpc_id = aws_vpc.vpc

  route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_pub_rtb"
    }
  )
}

# Public Route Table Association
resource "aws_route_table_association" "pub_subnets" {
  count = length(var.subnet_azs)

  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.pub_rtb.*.id, count.index)
}

# Elastic IP
resource "aws_eip" "nat_gw_eip" {
  vpc = true
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_eip"
    }
  )
}

# Nat Gateway
resource "aws_nat_gateway" "nat_gw" {
  depends_on    = [aws_internet_gateway.igw]
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.public_subnet[1].id
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_nat_gw"
    }
  )
}

# Private Route Table
resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.vpc

  route {
    cidr_block     = var.cidr_block
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_private_rtb"
    }
  )
}

# Private Route Table Association
resource "aws_route_table_association" "priv_subnets" {
  count = length(var.subnet_azs)

  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private_rtb.*.id, count.index)
}