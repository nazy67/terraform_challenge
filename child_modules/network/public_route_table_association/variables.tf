# providers variables
variable "aws_region" {
  type        = string
  description = " aws region to deploy infra"
  default     = ""
}

# # public subnet variables
# variable "public_subnet" {
#   type        = list(string)
#   description = "public subnets"
#   default     = []
# }

# subnet variables
variable "subnet_azs" {
  type        = list(string)
  description = "az's where infra will be deployed"
  default     = []
}

# # internet gateway variable
# variable "igw_id" {
#   type        = string
#   description = "internet gateway id"
#   default     = ""
# }

# # nat gateway variable
# variable "nat_gateway_id" {
#   type        = string
#   description = "route table cidr block"
#   default     = ""
# }

# variable "pub_route_table_id" {
#   type        = string
#   description = "cidr blocks for private subnets"
#   default     = ""
# }

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