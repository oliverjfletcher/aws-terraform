/**
 * AWS Terraform Demo
 */
######################################################################
# Define S3 Buckets for storing Cloud Trail Logs
######################################################################
resource "aws_s3_bucket" "cloudtrail" {
  bucket = var.s3_bucket_name_003
  acl    = var.s3_bucket_acl
  versioning {
    enabled = var.s3_bucket_versioning
  }
  tags = merge(
    {
      "name" = var.s3_bucket_name_003
    },
    var.standard_tags,
  )
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_arn_ct
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
  depends_on = [
    var.kms_key_arn_ct
  ]
}

######################################################################
# Define S3 Bucket Policy for Cloudtrail
######################################################################
resource "aws_s3_bucket_policy" "cloudtrail" {
  bucket = aws_s3_bucket.cloudtrail.id
  depends_on = [
    aws_s3_bucket.cloudtrail
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
