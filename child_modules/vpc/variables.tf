# Providers variables
variable "aws_region" {
  type        = string
  description = " aws region to deploy infra"
}

# VPC variables
variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for vpc"
}

variable "instance_tenancy" {
  type        = string
  description = "vpc tenancy default/dedicated"
}

variable "enabled_dns_support" {
  type        = bool
  description = "enabling dns support"
}

variable "enabled_dns_hostnames" {
  type        = bool
  description = "enabling dns hostnames"
}

variable "cidr_block" {
  type        = string
  description = "route table cidr block"
}

# Subnet variables
variable "subnet_azs" {
  type        = list(string)
  description = "az's where infra will be deployed "
}

variable "pub_cidr_subnet" {
  type        = list(string)
  description = "cird blocks for public subnets"
}

variable "priv_cidr_subnet" {
  type        = list(string)
  description = "cidr blocks for private subnets"
}

# Tags variables
variable "env" {
  type        = string
  description = "environment name"
}

variable "managed_by" {
  type        = string
  description = "managed by tr or cfn"
}

variable "owner" {
  type        = string
  description = "owner of the resources"
}

variable "giturl" {
  type        = string
  description = "git url to the template"
}