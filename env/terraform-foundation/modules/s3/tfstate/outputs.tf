/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "tf_state_arn" {
  value = aws_s3_bucket.tf_state.arn
}