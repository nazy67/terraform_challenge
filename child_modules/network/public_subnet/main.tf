# public subnets
resource "aws_subnet" "public_subnet" {
  count             = length(var.subnet_azs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.pub_cidr_subnet, count.index)
  availability_zone = element(var.subnet_azs, count.index)
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}-infra-${element(var.name_list, count.index)}-pubsub-${count.index + 1}"
    }
  )
}