resource "aws_subnet" "public" {
  count             = "${var.nat_count}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 1, count.index )}"
  availability_zone = "${element(split(",", var.zones), count.index)}"

  tags {
    owner       = "${var.owner}"
    Name        = "public_${var.environment}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private" {
  count             = "${var.nat_count}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 1, count.index + 3 )}"
  availability_zone = "${element(split(",", var.zones), count.index)}"

  tags {
    owner       = "${var.owner}"
    Name        = "private_${var.environment}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}
