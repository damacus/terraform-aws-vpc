resource "aws_cloudwatch_log_group" "vpc" {
  name              = "${var.environment}-vpc-log-group"
  retention_in_days = "${var.flow_log_retention_period}"
}

resource "aws_flow_log" "vpc" {
  log_group_name = "management-log-group"
  iam_role_arn   = "${aws_iam_role.log_role.arn}"
  vpc_id         = "${aws_vpc.vpc.id}"
  traffic_type   = "ALL"
  depends_on     = ["aws_cloudwatch_log_group.management", "aws_iam_role.log_role"]
}
