# internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_igw"
    }
  )
}