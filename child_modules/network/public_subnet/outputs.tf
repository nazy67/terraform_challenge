# public subnet id's
output "pubsub_1_id" {
  value = aws_subnet.pubsub[1].id
}
output "pubsub_2_id" {
  value = aws_subnet.pubsub[2].id
}