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

  tags = "${merge(
      local.default_tags,
      map("Name", "igw_${terraform.env}")
  )}"
}
