resource "aws_iam_role" "vpc_flow_log" {
  name               = "vpc-flow-log-${terraform.workspace}"
  assume_role_policy = data.aws_iam_policy_document.vpc_flow_log_sts.json
}

data "aws_iam_policy_document" "vpc_flow_log_sts" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "vpc_flow_log_policy" {
  name   = "vpc-flow-log-${terraform.workspace}"
  role   = aws_iam_role.vpc_flow_log.id
  policy = data.aws_iam_policy_document.vpc_flow_log_policy.json
}

data "aws_iam_policy_document" "vpc_flow_log_policy" {
  statement {
    resources = ["*"]
    effect    = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]
  }
}
