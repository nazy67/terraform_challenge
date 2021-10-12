output "module_vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "module_public_subnet_1" {
  value = aws_subnet.public_subnet_1.id
}

output "module_public_subnet_2" {
  value = aws_subnet.public_subnet_2.id
}

output "module_private_subnet_1" {
  value = aws_subnet.private_subnet_1.id
}

output "module_private_subnet_2" {
  value = aws_subnet.private_subnet_2.id
}