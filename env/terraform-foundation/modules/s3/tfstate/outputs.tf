/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "terraform_state_primary_arn" {
  value = aws_s3_bucket.terraform_state_primary.arn
}