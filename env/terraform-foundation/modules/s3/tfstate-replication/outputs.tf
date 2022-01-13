/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "s3_tf_state_replication_arn" {
  value = aws_s3_bucket.tf_state_replication.arn
}