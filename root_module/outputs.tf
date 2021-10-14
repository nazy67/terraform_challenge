# VPC outputs
output "module_vpc_id" {
  description = "vpc id"
  value       = module.vpc.vpc_id
}

output "module_private_subnet_3" {
  description = "private subnet id 3"
  value       = module.vpc.private_subnet_3
}

output "module_private_subnet_4" {
  description = "private subnet id 4"
  value       = module.vpc.private_subnet_4
}

output "module_public_subnet_1" {
  description = "public subnet id 1"
  value       = module.vpc.public_subnet_1
}

output "module_public_subnet_2" {
  description = "public subnet id 2"
  value       = module.vpc.public_subnet_2
}

# Bastion outputs
output "module_ec2_pub_ip" {
  description = "public ip of ec2 server"
  value       = module.ec2.ec2_public_ip
}

output "module_ec2_state" {
  description = "ec2 server state"
  value       = module.ec2.ec2_state
}

output "module_ec2_priv_ip" {
  description = "ec2 server private ip"
  value       = module.ec2.ec2_private_ip
}

output "module_ec2_sg_id" {
  description = "ec2 server sg id"
  value       = module.ec2.ec2_sg_id
}

# ALB outputs
output "module_lb_id" {
  description = "load balancer id"
  value       = module.alb.lb_id
}

output "module_lb_arn" {
  description = "arn of the load balancer"
  value       = module.alb.lb_arn
}

output "module_http_list_arn" {
  description = "http listener arn"
  value       = module.alb.http_listener_arn
}

output "module_tg_arn" {
  description = "target group arn"
  value       = module.alb.target_group_arn
}

output "module_lb_sg_id" {
  description = "load balancer sg id"
  value       = module.alb.lb_sg_id
}

# ASG outputs
output "module_asg_id" {
  description = "the autoscaling group id"
  value       = module.asg.autoscaling_group_id
}

output "module_asg_arn" {
  description = "the arn for this asg"
  value       = module.asg.autoscaling_group_arn
}

output "module_lt_id" {
  description = "the id of the launch template"
  value       = module.asg.launch_template_id
}

output "module_lt_arn" {
  description = "the arn of the launch template"
  value       = module.asg.launch_template_arn
}

output "module_lt_sg" {
  description = "the name of the launch template sg"
  value       = module.asg.launch_template_sg
}

# S3 bucket outputs
output "module_s3_bucket_id" {
  value = module.s3.s3_bucket_id
}

output "module_s3_bucket_arn" {
  value = module.s3.s3_bucket_arn
}