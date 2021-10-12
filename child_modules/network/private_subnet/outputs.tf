# private subnet id's
output "privsub_ids" {
  value = aws_subnet.private_subnet[*].id
}