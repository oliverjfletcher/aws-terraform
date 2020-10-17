/**
 * AWS Terraform Demo
 */
######################################################################
# Define IAM Role for VPC Flow Logs
######################################################################
resource "aws_iam_role" "flow_logs_cloudwatch_role" {
  name = var.iam_flow_logs_assume_role
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}
######################################################################
# Define IAM Policy for VPC Flow Logs to CloudWatch
######################################################################
resource "aws_iam_policy" "flow_logs_cloudwatch_policy" {
  name = var.iam_flow_logs_policy
  policy = <<POLICY
{
	"Version": "2012-10-17",
	"Statement": [{
		"Action": [
			"logs:CreateLogGroup",
			"logs:CreateLogStream",
			"logs:PutLogEvents",
			"logs:DescribeLogGroups",
			"logs:DescribeLogStreams"
		],
		"Effect": "Allow",
		"Resource": "*"
	}]
}
POLICY
}
######################################################################
# Define IAM Policy attachment for VPC Flow Logs
######################################################################
resource "aws_iam_role_policy_attachment" "flow_logs_assume" {
  role       = aws_iam_role.flow_logs_cloudwatch_role.id
  policy_arn = aws_iam_policy.flow_logs_cloudwatch_policy.arn
  depends_on = [
      aws_iam_role.flow_logs_cloudwatch_role,
      aws_iam_policy.flow_logs_cloudwatch_policy
  ]
}


