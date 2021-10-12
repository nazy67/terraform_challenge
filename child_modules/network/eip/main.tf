# elastic ip
resource "aws_eip" "eip" {
  vpc = true
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}_eip"
    }
  )
}