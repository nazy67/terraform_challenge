# VPC outputs
output "vpc_id" {
  description = "vpc id"    
  value       = module.vpc.module_vpc_id
}

output "private_subnet_1" {
  description = "private subnet id 1"
  value       = module.vpc.module_private_subnet_1
}

output "private_subnet_2" {
  description = "private subnet id 2"
  value       = module.vpc.module_private_subnet_2
}

output "public_subnet_1" {
  description = "public subnet id 1"
  value       = module.vpc.module_public_subnet_1
}

output "public_subnet_2" {
  description = "public subnet id 2"
  value       = module.vpc.module_public_subnet_2
}

# Bastion outputs
output "module_bastion_public_ip" {
  description = "public ip of bastion"
  value = module.bastion.bastion_public_ip
}

output "module_bastion_state" {
  description = "bastion hosts state"
  value = module.bastion.bastion_state
}

output "module_bastion_private_ip" {
  description = "bastion hosts private ip"
  value = module.bastion.bastion_private_ip
}

output "module_bastion_sg_id" {
  description = "bastion hosts sg id"
  value = module.bastion.bastion_sg_id
}