# private subnet id's
output "privsub_1_id" {
  value = aws_subnet.privsub[1].id
}
output "privsub_2_id" {
  value = aws_subnet.privsub[2].id
}