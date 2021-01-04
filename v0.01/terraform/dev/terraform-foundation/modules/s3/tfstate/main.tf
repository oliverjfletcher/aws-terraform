/**
 * AWS Terraform Demo
 */
######################################################################
# Define S3 Buckets for storing Terraform Backend
######################################################################
resource "aws_s3_bucket" "terraform_state_primary" {
  bucket = var.s3_bucket_name_001
  acl    = var.s3_bucket_acl
  versioning {
    enabled    = var.s3_bucket_versioning
  }
  tags = merge(
      {
        "name" = var.s3_bucket_name_001
      },
      var.standard_tags,
      )  

  replication_configuration {
    role = var.iam_role_replication_arn

    rules {
      id     = var.s3_bucket_replication_rule_id
      prefix = var.s3_bucket_replication_rule_prefix
      status = var.s3_bucket_replication_status

      destination {
        bucket        = var.s3_bucket_tfstate_arn
        storage_class = var.s3_bucket_replication_storage_class
      }
    }
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_arn_tf
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
  depends_on = [
      var.iam_role_replication_arn
  ]
}