# public route table
resource "aws_route_table" "pub_rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_pub_rtb"
    }
  )
}