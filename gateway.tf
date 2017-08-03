resource "aws_nat_gateway" "nat_gw" {
  count         = "${length(data.aws_availability_zones.available.names)}"
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"
}

resource "aws_eip" "nat" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc   = true
}

resource "aws_internet_gateway" "internet" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "internet_gateway_${var.name}_${terraform.env}"
    Description = "IGW for ${terraform.env}"
    owner       = "${var.owner}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${terraform.env}"
  }
}
