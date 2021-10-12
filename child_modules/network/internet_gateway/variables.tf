# providers variables
variable "aws_region" {
  type        = string
  description = " aws region to deploy infra"
  default = ""
}
# vpc id variable
variable "vpc_id" {
  description = "specify id of the vpc"
  type        = string
  default     = ""
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