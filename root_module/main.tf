provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source =  "github.com/nazy67/tf_modules_challenge//vpc"

  # vpc 
  vpc_cidr_block    = "10.1.0.0/16"
  instance_tenancy  = "default"
  is_enabled_dns_support = true
  is_enabled_dns_hostnames = true
  cidr_block  = "0.0.0.0/0"

  # availability zone
  aws_az_1a         = "us-east-1a"
  aws_az_1b         = "us-east-1b"

  pub_cidr1_subnet  = "10.1.0.0/24"
  pub_cidr2_subnet  = "10.1.1.0/24"
  priv_cidr1_subnet = "10.1.2.0/24"
  priv_cidr2_subnet = "10.1.3.0/24"
  
  # tags
  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}

module "bastion" {
  source =  "github.com/nazy67/tf_modules_challenge//bastion"

  # instance
  subnet_id         = module.vpc.module_public_subnet_2
  instance_type     = "t3.micro"
  image_id          = "ami-02e0bb36c61bb9715"
  key_name          = "new-key"
  # associate_pub_ip_addr = true  # by default is true

  # ebs volume
  root_volume_size = "20"
  ebs_volume_type  = "gp2"
  
  vpc_id     = module.vpc.module_vpc_id
  
  # sg group
  rule_type          = "ingress"
  ssh_port           = "22"
  protocol_type      = "tcp"
  ssh_ip_ingress = ["108.210.198.102/32"]
  # web_sg             =    

  # tags
  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}