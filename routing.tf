/* Public */
resource "aws_route_table" "public" {
  count  = length(data.aws_availability_zones.available.names)
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.tags, { "Name" = "public_route_table_${terraform.workspace}_${count.index}" })
}

resource "aws_route_table_association" "public" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[count.index].id
}

resource "aws_route" "public_default" {
  count                  = length(data.aws_availability_zones.available.names)
  route_table_id         = aws_route_table.public[count.index].id
  gateway_id             = aws_internet_gateway.internet.id
  destination_cidr_block = "0.0.0.0/0"
}

/* Private */
resource "aws_route_table" "private" {
  count  = length(data.aws_availability_zones.available.names)
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.tags, { "Name" = "private_route_table_${terraform.workspace}_${count.index}" })
}

resource "aws_route_table_association" "private" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_route" "private_default" {
  count                  = length(data.aws_availability_zones.available.names)
  route_table_id         = aws_route_table.private[count.index].id
  nat_gateway_id         = aws_nat_gateway.nat_gw[count.index].id
  destination_cidr_block = "0.0.0.0/0"
}

/* Database */
resource "aws_route_table" "database" {
  count  = length(data.aws_availability_zones.available.names)
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.tags, { "Name" = "database_route_table_${terraform.workspace}_${count.index}" })
}

resource "aws_route_table_association" "database" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database[count.index].id
}

resource "aws_route" "database_default" {
  count                  = length(data.aws_availability_zones.available.names)
  route_table_id         = aws_route_table.database[count.index].id
  nat_gateway_id         = aws_nat_gateway.nat_gw[count.index].id
  destination_cidr_block = "0.0.0.0/0"
}
