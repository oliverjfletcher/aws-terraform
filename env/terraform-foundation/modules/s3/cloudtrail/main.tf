/**
 * AWS Terraform Demo
 */
######################################################################
# Define S3 Buckets for storing Cloud Trail Logs
######################################################################
resource "aws_s3_bucket" "cloudtrail" {
  bucket = var.s3_bucket_name_003
  tags = merge(
    {
      "name" = var.s3_bucket_name_003
    },
    var.standard_tags,
  )
}

resource "aws_s3_bucket_versioning" "cloudtrail_versioning" {
  bucket = aws_s3_bucket.cloudtrail.id
  versioning_configuration {
    status = var.s3_bucket_versioning
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudtrail_encryption" {
  bucket = aws_s3_bucket.cloudtrail.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn_ct
      sse_algorithm     = var.sse_algorithm
    }
  }
  depends_on = [
    var.kms_key_arn_ct
  ]
}


resource "aws_s3_bucket_acl" "cloudtrail_acl" {
  bucket = aws_s3_bucket.cloudtrail.id
  acl    = var.s3_bucket_acl
}

resource "aws_s3_bucket_public_access_block" "cloudtrail_block_public"{
    bucket = aws_s3_bucket.cloudtrail.id
    block_public_policy = var.block_public_policy
    ignore_public_acls = var.ignore_public_acls
    restrict_public_buckets = var.restrict_public_buckets
}


######################################################################
# Define S3 Bucket Policy for Cloudtrail
######################################################################
resource "aws_s3_bucket_policy" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail.id

  depends_on = [
    aws_s3_bucket.cloudtrail,
    aws_s3_bucket_versioning.cloudtrail_versioning,
    aws_s3_bucket_server_side_encryption_configuration.cloudtrail_encryption,
    aws_s3_bucket_acl.cloudtrail_acl
  ]
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck20150319",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::useds3b002"
        },
        {
            "Sid": "AWSCloudTrailWrite20150319",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::useds3b002/AWSLogs/995351360350/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        },
        {
            "Sid": "AWSCloudTrailWrite20150319",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::useds3b002/cloudtrail/AWSLogs/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
