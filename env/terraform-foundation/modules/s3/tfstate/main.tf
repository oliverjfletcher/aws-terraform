/**
 * AWS Terraform Demo
 */
######################################################################
# Define S3 Buckets for storing Terraform Backend
######################################################################
resource "aws_s3_bucket" "tf_state" {
  bucket = var.s3_bucket_name_001
  tags = merge(
    {
      "name" = var.s3_bucket_name_001
    },
    var.standard_tags,
  )
}

resource "aws_s3_bucket_replication_configuration" "tf_state_replication_configuration" {
  bucket = aws_s3_bucket.tf_state.id
  role   = var.iam_role_replication_arn

  rule {
    id     = var.s3_bucket_replication_rule_id
    prefix = var.s3_bucket_replication_rule_prefix
    status = var.s3_bucket_replication_status

    destination {
        bucket        = var.s3_bucket_tfstate_arn
        storage_class = var.s3_bucket_replication_storage_class
    }
  }
  depends_on = [
    var.iam_role_replication_arn
  ]
}

resource "aws_s3_bucket_acl" "tf_state_acl" {
  bucket = aws_s3_bucket.tf_state.id
  acl    = var.s3_bucket_acl
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = var.s3_bucket_versioning
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_encryption" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn_tf
      sse_algorithm     = var.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tf_state_block_public" {
    bucket                  = aws_s3_bucket.tf_state.id
    block_public_policy     = var.block_public_policy
    ignore_public_acls      = var.ignore_public_acls
    restrict_public_buckets = var.restrict_public_buckets
}