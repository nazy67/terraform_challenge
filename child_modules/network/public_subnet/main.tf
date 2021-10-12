# public subnets
resource "aws_subnet" "public_subnet" {
  count             = length(var.subnet_azs)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.pub_cidr_subnet, count.index)
  availability_zone = element(var.subnet_azs, count.index)
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_infra_${element(var.name_list, count.index)}_pubsub_${count.index + 1}"
    }
  )
}