resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_network}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "VPC ${local.environment}"
    Description = "VPC Flow log for ${var.project} ${local.environment}"
    owner       = "${var.owner}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${local.environment}"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id          = "${aws_vpc.vpc.id}"
  service_name    = "com.amazonaws.${var.region}.s3"
  route_table_ids = ["${aws_vpc.vpc.main_route_table_id}"]
}
