/**
 * Onica DevOps Test
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "kms_key_arn" {
  value = aws_kms_key.cloudwatch_key.arn
}