# providers variables
variable "aws_region" {
  type        = string
  description = " aws region to deploy infra"
  default     = ""
}

# vpc id variable
variable "vpc_id" {
  description = "specify id of the vpc"
  type        = string
  default     = ""
}

# internet gateway variable
variable "igw_id" {
  type        = string
  description = "internet gateway id"
  default     = ""
}

# cidr block variable
variable "dest_cidr_block" {
  type        = string
  description = "destination cidr block"
  default     = ""
}

# subnet variables
variable "subnet_azs" {
  type        = list(string)
  description = "az's where infra will be deployed"
  default     = []
}

# tag variables
variable "env" {
  type        = string
  description = "environment name"
  default     = ""
}

variable "managed_by" {
  type        = string
  description = "managed by tr or cfn"
  default     = ""
}

variable "owner" {
  type        = string
  description = "owner of the resources"
  default     = ""
}

variable "giturl" {
  type        = string
  description = "git url to the template"
  default     = ""
}