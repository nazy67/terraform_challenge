# providers variables
variable "aws_region" {
  type        = string
  description = " aws region to deploy infra"
  default = ""
}

# subnet variables
variable "pub_subnet_id" {
  type        = string
  description = "cird blocks for public subnets"
  default     = ""
}

variable "pub_route_table_id" {
  type        = string
  description = "cidr blocks for private subnets"
  default     = ""
}

# tags variables
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