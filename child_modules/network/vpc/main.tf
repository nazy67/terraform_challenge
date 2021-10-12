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