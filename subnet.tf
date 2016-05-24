resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.main_vpc.id}"
  cidr_block = "${cidrsubnet(aws_vpc.main_vpc.cidr_block, 1, 0 )}"

  tags {
    owner       = "${var.owner}"
    Name        = "${var.environment}_subnet"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.main_vpc.id}"
  cidr_block = "${cidrsubnet(aws_vpc.main_vpc.cidr_block, 1, 1 )}"

  tags {
    owner       = "${var.owner}"
    Name        = "${var.environment}_subnet"
    Description = "${var.description}"
    email       = "${var.email}"
    cost_code   = "${var.cost}"
    environment = "${var.environment}"
  }
}
