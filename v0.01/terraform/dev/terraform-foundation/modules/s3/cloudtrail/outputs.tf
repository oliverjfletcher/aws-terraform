/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "s3_cloudtrail_id" {
  value = aws_s3_bucket.cloudtrail.id
}