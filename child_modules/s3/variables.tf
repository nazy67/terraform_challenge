# Providers variables
variable "aws_region" {
  type        = string
  description = " aws region to deploy infra"
}

# Tag variables
variable "env" {
  type = string
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