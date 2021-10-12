# nat gateway
resource "aws_nat_gateway" "nat_gw" {
  depends_on    = [aws_internet_gateway.igw]
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet[1].id
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_nat_gw"
    }
  )
}