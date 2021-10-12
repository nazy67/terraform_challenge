# public subnet id's
output "pubsub_ids" {
  value = aws_subnet.public_subnet[*].id
}