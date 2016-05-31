output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet" {
  value = "${aws_subnet.public.id}"
}

output "private_subnet" {
  value = "${aws_subnet.private.id}"
}

output "database_subnets" {
  value = "${join(",", aws_subnet.database.*.id)}"
}
