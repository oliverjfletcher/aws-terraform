/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "cloudwatch_log_group_arn" {
  value = aws_cloudwatch_log_group.vpc_flow_logs.arn
}