/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "iam_role_replication_arn" {
  value = aws_iam_role.replication.arn
}