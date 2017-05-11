resource "aws_flow_log" "vpc_flow_log" {
  log_group_name = "vpc_flow_log_${var.environment}"
  iam_role_arn   = "${aws_iam_role.vpc_flow_log.arn}"
  vpc_id         = "${aws_vpc.vpc.id}"
  traffic_type   = "ALL"
}

resource "aws_cloudwatch_log_group" "vpc_flow_log" {
  name = "vpc_flow_log_${var.environment}"
  retention_in_days = "${var.flow_log_retention_period}"

  tags {
    owner          = "${var.owner}"
    Name           = "${var.environment}"
    Description    = "${var.description}"
    email          = "${var.email}"
    cost_code_code = "${var.cost_code}"
    environment    = "${var.environment}"
  }
}
