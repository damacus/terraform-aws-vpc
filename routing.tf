/* Public */
resource "aws_route_table" "public" {
  count  = 3
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    owner       = "${var.owner}"
    Name        = "${var.environment}_public_route_table_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "public" {
  count          = 3
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}

resource "aws_route" "public_default" {
  count                  = 3
  route_table_id         = "${element(aws_route_table.public.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet.id}"
}

/* Private */
resource "aws_route_table" "private" {
  count  = 3
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    owner       = "${var.owner}"
    Name        = "${var.environment}_private_route_table_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "private" {
  count          = 3
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_route" "private_default" {
  count                  = 3
  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.nat_gw.*.id, count.index)}"
}

/* Database */
resource "aws_route_table" "database" {
  count  = 3
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    owner       = "${var.owner}"
    Name        = "${var.environment}_database_route_table_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "database" {
  count          = 3
  subnet_id      = "${element(aws_subnet.database.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.database.*.id, count.index)}"
}

resource "aws_route" "database_default" {
  count                  = 3
  route_table_id         = "${element(aws_route_table.database.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.nat_gw.*.id, count.index)}"
}
