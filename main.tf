resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_network
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge(local.tags, { "Name" = "VPC" })
}

output "vpc" {
  value = aws_vpc.vpc
}

data "aws_region" "current" {}

resource "aws_vpc_endpoint" "s3" {
  vpc_id          = aws_vpc.vpc.id
  service_name    = "com.amazonaws.${data.aws_region.current.name}.s3"
  route_table_ids = [aws_vpc.vpc.main_route_table_id]
}
