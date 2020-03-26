resource "aws_nat_gateway" "nat_gw" {
  count         = length(data.aws_availability_zones.available)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
}

resource "aws_eip" "nat" {
  count = length(data.aws_availability_zones.available.names)
  vpc   = true
}

resource "aws_internet_gateway" "internet" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.tags, { "Name" = "igw_${terraform.workspace}" })
}
