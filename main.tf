resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_network}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "${var.environment}"
    Description = "${var.description}"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id          = "${var.vpc_id}"
  service_name    = "com.amazonaws.s3"
  route_table_ids = ["${aws_vpc.vpc.main_route_table_id}"]
}
