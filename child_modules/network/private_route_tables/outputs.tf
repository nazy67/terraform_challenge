# vpc public/private toute table
output "private_rtb_id" {
  value = aws_route_table.private_rtb.id
}