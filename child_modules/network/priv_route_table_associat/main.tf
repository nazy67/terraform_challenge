# private route table association
resource "aws_route_table_association" "priv_subnets" {
  count = length(var.subnet_azs)

  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private_rtb.*.id, count.index)
}