/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for S3 Bucket to be provisioned
########################################################################

variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map(any)
}

variable "s3_bucket_name_002" {
  description = "Terraform State S3 Bucket"
  type        = string
}


variable "s3_bucket_acl" {
  description = "Terraform State S3 Bucket ACL"
  type        = string
}

variable "s3_bucket_versioning" {
  description = "Terraform State S3 Bucket Versioning"
  type        = string
}

variable "s3_bucket_lifecycle" {
  description = "Terraform State S3 Bucket Lifecycle"
  type        = string
}

variable "kms_key_arn_tf" {
  description = "KMS Key ARN for S3 Bucket"
  type        = string
}

variable "sse_algorithm" {
  description = "SSE Server side encryption algorithm"
  type        = string
}
