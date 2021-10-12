# private subnets
resource "aws_subnet" "private_subnet" {
  count             = length(var.subnet_azs)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.priv_cidr_subnet, count.index)
  availability_zone = element(var.subnet_azs, count.index)
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}-infra-${element(var.name_list, count.index)}-privsub-${count.index + 1}"
    }
  )
}