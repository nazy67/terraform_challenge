# public route table
resource "aws_route_table" "pub_rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr_block
    gateway_id = var.igw_id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_pub_rtb"
    }
  )
}

# public route table association
resource "aws_route_table_association" "pub_subnets" {
  count = length(var.subnet_azs)

  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.pub_rtb.*.id, count.index)
}