# vpc id
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# vpc public subnet id's
output "pubsub_1_id" {
  value = aws_subnet.pubsub[1].id
}
output "pubsub_2_id" {
  value = aws_subnet.pubsub[2].id
}

# vpc private subnet id's
output "privsub_1_id" {
  value = aws_subnet.privsub[1].id
}
output "privsub_2_id" {
  value = aws_subnet.privsub[2].id
}

# vpc cidr block
output "vpc_cidr_blk" {
  value = aws_vpc.vpc.cidr_block
}

# vpc public subnet cidr block
output "pub1_cidr_blk" {
  value = aws_subnet.pubsub[1].cidr_block
}
output "pub2_cidr_blk" {
  value = aws_subnet.pubsub[2].cidr_block
}

# vpc private subnet cidr block
output "priv1_cidr_blk" {
  value = aws_subnet.privsub[1].cidr_block
}
output "priv2_cidr_blk" {
  value = aws_subnet.privsub[2].cidr_block
}

# vpc public/private toute table
output "public_rtb_id" {
  value = aws_route_table.pubrtb.id
}
output "private_rtb_id" {
  value = aws_route_table.privrtb.id
}
