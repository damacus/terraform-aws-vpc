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
    owner       = "${var.tag_owner}"
    Name        = "${var.tag_environment}"
    Description = "${var.tag_description}"
    email       = "${var.tag_email}"
    cost_code   = "${var.tag_cost}"
    environment = "${var.tag_environment}"
  }
}
