resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc.cidr_block, 1, 0 )}"

  tags {
    owner       = "${var.owner}"
    Name        = "${var.environment}_subnet"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc.cidr_block, 1, 1 )}"

  tags {
    owner       = "${var.owner}"
    Name        = "${var.environment}_subnet"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${var.environment}"
  }
}
