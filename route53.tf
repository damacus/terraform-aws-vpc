/*resource "aws_route53_record" "project_record" {
  zone_id  = "${var.zone_id}"
  name     = "${var.project}"
  type     = "NS"
  ttl      = "300"
  records  = ["${aws_route53_zone.public.name_servers}"] #TODO
  provider = "${var.provider}"
}

resource "aws_route53_zone" "public" {
  name = "${var.project}.${var.main_domain}"
}

resource "aws_route53_zone" "private" {
  name   = "${var.project}.${var.main_domain}"
  vpc_id = "${aws.management.vpc.id}"
}*/
