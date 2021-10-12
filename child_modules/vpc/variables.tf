# Providers variables
variable "aws_region" {
  type        = string
  description = " aws region to deploy infra"
  default = ""
}

# VPC variables
variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for vpc"
  default = ""
}

variable "instance_tenancy" {
  type        = string
  description = "vpc tenancy default/dedicated"
  default = ""
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
  default = ""
}

# Subnet variables
variable "subnet_azs" {
  type        = list(string)
  description = "az's where infra will be deployed"
  default     = []
}

variable "name_list" {
  type = list(string)
  description = " subnet name list"
  default     = []
}

variable "pub_cidr_subnet" {
  type        = list(string)
  description = "cird blocks for public subnets"
  default     = []
}

variable "priv_cidr_subnet" {
  type        = list(string)
  description = "cidr blocks for private subnets"
  default     = []
}

# Tags variables
variable "env" {
  type        = string
  description = "environment name"
  default = ""
}

variable "managed_by" {
  type        = string
  description = "managed by tr or cfn"
  default = ""
}

variable "owner" {
  type        = string
  description = "owner of the resources"
  default = ""
}

variable "giturl" {
  type        = string
  description = "git url to the template"
  default = ""
}