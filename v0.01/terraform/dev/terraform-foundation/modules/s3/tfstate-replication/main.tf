/**
 * AWS Terraform Demo
 */
######################################################################
# Define S3 Buckets for storing Terraform Backend
######################################################################
resource "aws_s3_bucket" "tf_state_replication" {
  
  bucket   = var.s3_bucket_name_002
  acl      = var.s3_bucket_acl
  versioning {
    enabled = var.s3_bucket_versioning
  }
  tags = merge(
      {
        "name" = var.s3_bucket_name_002
      },
      var.standard_tags,
      )
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_arn
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
}


