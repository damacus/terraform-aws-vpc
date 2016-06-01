resource "aws_subnet" "public" {
  count             = "${var.nat_count}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index )}"
  availability_zone = "${element(split(",", var.zones), count.index)}"

  tags {
    owner       = "${var.owner}"
    Name        = "public_${var.environment}_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private" {
  count             = "${var.nat_count}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index + 3 )}"
  availability_zone = "${element(split(",", var.zones), count.index)}"

  tags {
    owner       = "${var.owner}"
    Name        = "private_${var.environment}_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "database" {
  count             = "${var.nat_count}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index + 6)}"
  availability_zone = "${element(split(",", var.zones), count.index)}"

  tags {
    owner       = "${var.owner}"
    Name        = "database_${var.environment}_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "small-firefly" {
  count             = "${var.nat_count}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index + 9)}"
  availability_zone = "${element(split(",", var.zones), count.index)}"

  tags {
    owner       = "${var.owner}"
    Name        = "small-firefly_${var.environment}_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "hidden-dawn" {
  count             = "${var.nat_count}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index + 12)}"
  availability_zone = "${element(split(",", var.zones), count.index)}"

  tags {
    owner       = "${var.owner}"
    Name        = "hidden-dawn_${var.environment}_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}
