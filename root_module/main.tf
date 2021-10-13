provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source =  "github.com/nazy67/tf_modules_challenge//vpc"

  # VPC 
  vpc_cidr_block    = "10.1.0.0/16"
  instance_tenancy  = "default"
  is_enabled_dns_support = true
  is_enabled_dns_hostnames = true
  cidr_block  = "0.0.0.0/0"

  # Availability zone
  aws_az_1a         = "us-east-1a"
  aws_az_1b         = "us-east-1b"

  pub_cidr1_subnet  = "10.1.0.0/24"
  pub_cidr2_subnet  = "10.1.1.0/24"
  priv_cidr3_subnet = "10.1.2.0/24"
  priv_cidr4_subnet = "10.1.3.0/24"
  
  # Tags
  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}

module "bastion" {
  source =  "github.com/nazy67/tf_modules_challenge//bastion"

  # Instance
  subnet_id         = module.vpc.module_public_subnet_2
  instance_type     = "t3.micro"
  image_id          = "ami-02e0bb36c61bb9715"
  key_name          = "new-key"

  # EBS volume
  root_volume_size = 20
  ebs_volume_type  = "gp2"  
  vpc_id     = module.vpc.module_vpc_id
  
  # SG group
  rule_type          = "ingress"
  ssh_port           = 22
  http_port          = 80
  protocol_type      = "tcp"
  ssh_ip_ingress     = ["108.210.198.102/32"]
  launch_template_sg = module.asg.launch_template_sg  

  # Tags
  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}

module "asg" {
  source =  "github.com/nazy67/tf_modules_challenge//asg"

  # Autoscaling group
  asg_name           = "${var.env}_asg"
  min_size           = 2
  max_size           = 6
  desired_capacity   = 6
  health_check_type  = "ELB"
  target_group_arns  = [module.alb.target_group_arn]

  vpc_zone_identifier  = [module.vpc.module_private_subnet_4]  

  # Launch template
  name_prefix       = "${var.env}_web_template"
  instance_type     = "t3.micro"
  image_id          = "ami-02e0bb36c61bb9715"
  key_name          = "new-key"
  security_groups   = [module.asg.launch_template_sg]
  user_data_base64  =  filebase64("${path.module}/user_data.sh") #data.template_file.user_data.rendered

  # EBS root volume
  block_device_mappings = [
    {    
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
    }
  ]
    
  # Launch template sg group
  asg_sg_name    = "${var.env}_web_sg"
  vpc_id         = module.vpc.module_vpc_id 
  rule_type      = "ingress"
  ssh_port       = 22
  http_port      = 80
  protocol_type  = "tcp"
  
  bastion_sg     = module.bastion.bastion_sg_id
  lb_sg         = module.alb.lb_sg_id  

  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}

module "alb" {
  source =  "github.com/nazy67/tf_modules_challenge//alb"

  # ALB
  lb_name   = "${var.env}_web_lb"
  is_internal = false
  load_balancer_type = "application"
  security_groups = [module.alb.lb_sg_id]
  public_subnets = [module.vpc.module_public_subnet_1, module.vpc.module_public_subnet_2]
  
  # Target group
  tg_name = "${var.env}-lb-tg"
  vpc_id = module.vpc.module_vpc_id

  # HTTP listeners rule
  app_lb_arn = module.alb.lb_arn
  action_type  = "forward"
  tg_arn = module.alb.target_group_arn
  

  # ALB sg group
  lb_sg_name         = "${var.env}_lb_sg"
  lb_sg_description  = "allow http traffic"
  cidr_blocks        = ["0.0.0.0/0"]
  rule_type          = "ingress"
  http_port          = 80
  protocol_type      = "tcp"
  launch_template_sg = module.asg.launch_template_sg  

  # Tags
  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}