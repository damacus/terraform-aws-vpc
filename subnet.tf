resource "aws_subnet" "public" {
  count             = "${length(data.aws_availability_zones.available.names)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, "${length(data.aws_availability_zones.available.names)}", count.index )}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    owner       = "${var.owner}"
    Name        = "public_${terraform.env}_${count.index}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${terraform.env}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "private" {
  count             = "${length(data.aws_availability_zones.available.names)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, "${length(data.aws_availability_zones.available.names)}", count.index + "${length(data.aws_availability_zones.available.names)}" )}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    owner       = "${var.owner}"
    Name        = "private_${terraform.env}_${count.index}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${terraform.env}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "database" {
  count             = "${length(data.aws_availability_zones.available.names)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index + 12)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    owner       = "${var.owner}"
    Name        = "database_${terraform.env}_${count.index}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${terraform.env}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
