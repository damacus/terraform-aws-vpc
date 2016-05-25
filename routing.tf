resource "aws_route_table" "public" {
  count  = "${var.nat_count}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    owner       = "${var.owner}"
    Name        = "${var.environment}_route_table_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "public" {
  count          = "${var.nat_count}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}

resource "aws_route" "public_default" {
  count                  = "${var.nat_count}"
  route_table_id         = "${element(aws_route_table.public.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet.id}"
}

resource "aws_route_table" "private" {
  count = "${var.nat_count}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    owner       = "${var.owner}"
    Name        = "${var.environment}_route_table_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "private" {
  count          = "${var.nat_count}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_route" "private_default" {
  count                  = "${var.nat_count}"
  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.nat.*.id, count.index)}"
}
