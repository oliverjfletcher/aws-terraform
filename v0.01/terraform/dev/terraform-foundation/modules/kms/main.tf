/**
 * AWS Terraform Demo
 */
######################################################################
# Define KMS for S3 Encryption for storing Terraform Backend
######################################################################
resource "aws_kms_key" "s3_key" {
  deletion_window_in_days = var.kms_deletion_window_in_days
  enable_key_rotation     = var.kms_enable_key_rotation
  tags                    = var.standard_tags
  description             = var.kms_description
}
