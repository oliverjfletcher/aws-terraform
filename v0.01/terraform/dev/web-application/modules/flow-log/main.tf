/**
 * AWS Terraform Demo
 */
######################################################################
# Define VPC Flow Logs
######################################################################
resource "aws_flow_log" "main" {
  iam_role_arn    = var.flow_logs_cloudwatch_role
  log_destination = var.cloudwatch_group_arn
  traffic_type    = var.traffic_type
  vpc_id          = var.vpc_id
  tags = merge(
      {
        "name" = var.flow_logs_name
      },
      var.standard_tags,
      )
}
