/**
 * Onica DevOps Test
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "flow_logs_cloudwatch_role" {
  value = aws_iam_role.flow_logs_cloudwatch_role.arn
}