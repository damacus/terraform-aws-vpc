resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_network}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "${var.environment}"
    Description = "${var.description}"
  }
}

output "vpc_id" {
  value = "${aws_vpc.vpc}"
}
