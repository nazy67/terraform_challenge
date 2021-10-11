module "vpc" {
  source =  "github.com/nazy67/terraform_challenge//root_module/vpc"

aws_region        = "us-east-1"
vpc_cidr_block    = "10.1.0.0/16"
instance_tenancy  = "default"

enabled_dns_support = true
enabled_dns_hostnames = true
cidr_block  = "0.0.0.0/0"

subnet_azs       = ["us-east-1a", "us-east-1b"]
pub_cidr_subnet  = ["10.1.0.0/24", "10.1.1.0/24"]
priv_cidr_subnet = ["10.1.2.0/24", "10.1.3.0/24"]
}