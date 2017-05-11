data "aws_iam_policy_document" "vpc_flow_log_sts" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "vpc_flow_log_policy" {
  statement {
    actions = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents", "logs:DescribeLogGroups", "logs:DescribeLogStreams"]
    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role" "vpc_flow_log" {
  name               = "vpc-flow-log"
  assume_role_policy = "${data.aws_iam_policy_document.vpc_flow_log_sts.json}"
}

resource "aws_iam_role_policy" "vpc_flow_log_policy" {
  name   = "vpc-flow-log"
  role   = "${aws_iam_role.vpc_flow_log.id}"
  policy = "${data.aws_iam_policy_document.vpc_flow_log_policy.json}"
}
