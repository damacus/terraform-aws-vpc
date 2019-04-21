/* Public */
resource "aws_route_table" "public" {
  count  = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
      local.default_tags,
      map("Name", "public_route_table_${terraform.env}_${count.index}")
  )}"
}

resource "aws_route_table_association" "public" {
  count          = "${length(data.aws_availability_zones.available.names)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}

resource "aws_route" "public_default" {
  count                  = "${length(data.aws_availability_zones.available.names)}"
  route_table_id         = "${element(aws_route_table.public.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet.id}"
}

/* Private */
resource "aws_route_table" "private" {
  count  = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
      local.default_tags,
      map("Name", "private_route_table_${terraform.env}_${count.index}")
  )}"
}

resource "aws_route_table_association" "private" {
  count          = "${length(data.aws_availability_zones.available.names)}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_route" "private_default" {
  count                  = "${length(data.aws_availability_zones.available.names)}"
  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.nat_gw.*.id, count.index)}"
}

/* Database */
resource "aws_route_table" "database" {
  count  = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
      local.default_tags,
      map("Name", "database_route_table_${terraform.env}_${count.index}")
  )}"
}

resource "aws_route_table_association" "database" {
  count          = "${length(data.aws_availability_zones.available.names)}"
  subnet_id      = "${element(aws_subnet.database.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.database.*.id, count.index)}"
}

resource "aws_route" "database_default" {
  count                  = "${length(data.aws_availability_zones.available.names)}"
  route_table_id         = "${element(aws_route_table.database.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.nat_gw.*.id, count.index)}"
}
