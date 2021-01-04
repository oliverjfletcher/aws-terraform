/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for S3 to be used by other Terraform modules
########################################################################
output "s3_cloudtrail_id" {
  value = aws_s3_bucket.cloudtrail.id
}

output "s3_cloudtrail_bucket_policy_id" {
  value = aws_s3_bucket_policy.cloudtrail.id
}