output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_1" {
  value = aws_subnet.pubsub_1_id.id
}

output "public_subnet_2" {
  value = aws_subnet.pubsub_2_id.id
}

output "private_subnet_1" {
  value = aws_subnet.privsub_1_id.id
}

output "private_subnet_2" {
  value = aws_subnet.privsub_2_id.id
}