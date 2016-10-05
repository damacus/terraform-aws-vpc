resource "aws_subnet" "public" {
  count             = 3
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 3, count.index )}"
  availability_zone = "${data.aws_availability_zones.zone.names[count.index]}"

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
  count             = 3
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 3, count.index + 3 )}"
  availability_zone = "${data.aws_availability_zones.zone.names[count.index]}"

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
  count             = 3
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index + 12)}"
  availability_zone = "${data.aws_availability_zones.zone.names[count.index]}"

  tags {
    owner       = "${var.owner}"
    Name        = "database_${var.environment}_${count.index}"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}
