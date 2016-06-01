output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet" {
  value = "${join(",", aws_subnet.public.*.id)}"
}

output "private_subnet" {
  value = "${join(",", aws_subnet.private.*.id)}"
}

output "database_subnets" {
  value = "${join(",", aws_subnet.database.*.id)}"
}

# Extra subnets should you need them
output "small-firefly_subnets" {
  value = "${join(",", aws_subnet.small-firefly.*.id)}"
}

output "hidden-dawn_subnets" {
  value = "${join(",", aws_subnet.hidden-dawn.*.id)}"
}
