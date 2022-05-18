/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for S3 Bucket for Cloudtrail
########################################################################

variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map(any)
}

variable "s3_bucket_name_003" {
  description = "Cloud Trail S3 Bucket"
  type        = string
}


variable "s3_bucket_acl" {
  description = "Cloud Trail S3 Bucket ACL"
  type        = string
}

variable "s3_bucket_versioning" {
  description = "Cloud Trail S3 Bucket Versioning"
  type        = string
}

variable "s3_bucket_lifecycle" {
  description = "Cloud Trail S3 Bucket Lifecycle"
  type        = string
}

variable "kms_key_arn_ct" {
  description = "KMS Key ARN for S3 Bucket"
  type        = string
}

variable "sse_algorithm" {
  description = "SSE Server side encryption algorithm"
  type        = string
}

variable "block_public_policy" {
  description = "Reject calls to PUT Bucket policy if the specified bucket policy allows public access"
  type        = bool
}

variable "ignore_public_acls" {
  description = "Ignore public ACLs for this bucket"
  type        = bool
}

variable "restrict_public_buckets" {
  description = "Restrict public bucket policies for this bucket"
  type        = bool
}