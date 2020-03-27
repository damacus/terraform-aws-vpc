resource "aws_nat_gateway" "nat_gw" {
  count         = var.single_nat_gw ? 1 : length(aws_subnet.public)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags          = merge(local.tags, { Name = "nat-gw-${terraform.workspace}" })
}

resource "aws_eip" "nat" {
  count = var.single_nat_gw ? 1 : length(aws_subnet.public)
  vpc   = true
  tags  = merge(local.default_tags, { Name = "eip-nat-gw-${terraform.workspace}" })
}

resource "aws_internet_gateway" "internet" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.tags, { "Name" = "igw_${terraform.workspace}" })
}

variable "single_nat_gw" {
  default = false
  type    = bool
}
