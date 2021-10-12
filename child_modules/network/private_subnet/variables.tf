# providers variables
variable "aws_region" {
  type        = string
  description = " aws region to deploy infra"
  default = ""
}

# subnet variables
variable "subnet_azs" {
  type        = list(string)
  description = "az's where infra will be deployed"
  default     = []
}

variable "name_list" {
  type = list(string)
  description = "subnet name list"
  default     = []
}

variable "priv_cidr_subnet" {
  type        = list(string)
  description = "cidr blocks for private subnets"
  default     = []
}

# tag variables
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