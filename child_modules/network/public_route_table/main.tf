# public route table
resource "aws_route_table" "pub_rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.dest_cidr_block
    gateway_id = var.igw_id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_pub_rtb"
    }
  )
}