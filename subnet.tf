data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count             = "${length(data.aws_availability_zones.available.names)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index )}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags = "${merge(
      local.default_tags,
      map("Name", "public${terraform.env}_${count.index}")
  )}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "private" {
  count             = "${length(data.aws_availability_zones.available.names)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index + 6)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags = "${merge(
      local.default_tags,
      map("Name", "private_${terraform.env}_${count.index}")
  )}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "database" {
  count             = "${length(data.aws_availability_zones.available.names)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index + 12)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags = "${merge(
      local.default_tags,
      map("Name", "database_${terraform.env}_${count.index}")
  )}"

  lifecycle {
    create_before_destroy = true
  }
}
