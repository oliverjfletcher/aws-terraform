/**
 * Onica DevOps Test
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "kms_key_arn_tf" {
  value = aws_kms_key.s3_key_tf.arn
}

output "kms_key_arn_ct" {
  value = aws_kms_key.s3_key_ct.arn
}