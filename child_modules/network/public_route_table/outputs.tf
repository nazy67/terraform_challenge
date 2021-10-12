# vpc public/private toute table
output "public_rtb_id" {
  value = aws_route_table.pub_rtb.id
}