resource "aws_flow_log" "vpc_flow_log" {
  log_group_name = "vpc_flow_log_${var.project}_${terraform.env}"
  iam_role_arn   = "${aws_iam_role.vpc_flow_log.arn}"
  vpc_id         = "${aws_vpc.vpc.id}"
  traffic_type   = "ALL"
  depends_on     = ["aws_cloudwatch_log_group.vpc_flow_log"]
}

resource "aws_cloudwatch_log_group" "vpc_flow_log" {
  name              = "vpc_flow_log_${var.project}_${terraform.env}"
  retention_in_days = "${var.flow_log_retention_period}"

  tags {
    Name        = "vpc_flow_log_${var.project}_${terraform.env}"
    Description = "VPC Flow log for ${terraform.env}"
    owner       = "${var.owner}"
    email       = "${var.email}"
    cost_code   = "${var.cost_code}"
    environment = "${terraform.env}"
  }
}
