resource "aws_nat_gateway" "nat_gw" {
  count         = "${var.nat_count}"
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"
}

resource "aws_eip" "nat" {
  count = "${var.nat_count}"
  vpc   = true
}

resource "aws_internet_gateway" "internet" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    owner       = "${var.owner}"
    Name        = "${var.environment}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost}"
    environment = "${var.environment}"
  }
}
