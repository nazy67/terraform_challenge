provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "github.com/nazy67/tf_modules_challenge//vpc"
 
  vpc_cidr_block    = "10.1.0.0/16"

  aws_az_1a         = "us-east-1a"
  aws_az_1b         = "us-east-1b"

  pub_cidr1_subnet  = "10.1.0.0/24"
  pub_cidr2_subnet  = "10.1.1.0/24"
  priv_cidr3_subnet = "10.1.2.0/24"
  priv_cidr4_subnet = "10.1.3.0/24"

  s3_bucket_arn  = module.s3.s3_bucket_arn

  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}

module "ec2" {
  source = "github.com/nazy67/tf_modules_challenge//ec2"

  subnet_id     = module.vpc.public_subnet_2
  instance_type = "t3.micro"
  image_id      = "ami-02e0bb36c61bb9715"
  key_name      = "new-key"

  root_volume_size = 20
  ebs_volume_type  = "gp2"
  vpc_id           = module.vpc.vpc_id

  ssh_ip_ingress     = ["108.210.198.102/32"]
  launch_template_sg = module.asg.launch_template_sg

  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}

module "asg" {
  source = "github.com/nazy67/tf_modules_challenge//asg"

  asg_name          = "asg"
  min_size          = 2
  max_size          = 6
  desired_capacity  = 6
  health_check_type = "ELB"
  target_group_arns = [module.alb.target_group_arn]

  vpc_zone_identifier = [module.vpc.private_subnet_4]
   
  name_prefix      = "web-template-"
  instance_type    = "t3.micro"
  image_id         = "ami-02e0bb36c61bb9715"
  key_name         = "new-key"
  asg_security_group_ids = [module.asg.launch_template_sg]
  alb_target_group_arn = module.alb.target_group_arn
  user_data_base64 = filebase64("${path.module}/user_data.sh")

  asg_sg_name   = "web_sg"
  vpc_id        = module.vpc.vpc_id

  ec2_sg     = module.ec2.ec2_sg_id
  lb_sg      = module.alb.lb_sg_id

  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}

module "alb" {
  source = "github.com/nazy67/tf_modules_challenge//alb"

  lb_name                = "web-lb"
  alb_security_group_ids = [module.alb.lb_sg_id]
  public_subnets         = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]

  target_group_name = "lb-tg"
  vpc_id            = module.vpc.vpc_id

  app_lb_arn       = module.alb.lb_arn
  target_group_arn = module.alb.target_group_arn

  lb_sg_name         = "lb_sg"
  launch_template_sg = module.asg.launch_template_sg

  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}

module "s3" {
  source = "github.com/nazy67/tf_modules_challenge//s3"

  bucket_name   = "nazys-main-bucket"

  env        = "dev"
  managed_by = "terraform"
  owner      = "nazykh67@gmail.com"
  giturl     = "https://github.com/nazy67/terraform_challenge"
}