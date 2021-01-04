/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for S3 Bucket to be provisioned
########################################################################

variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map
}

variable "s3_bucket_name_001" {
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

variable "s3_bucket_replication_rule_id" {
  description = "Terraform S3 Replication Object ID"
  type        = string
}

variable "s3_bucket_replication_rule_prefix" {
  description = "Terraform S3 Replication Object Prefix"
  type        = string
}

variable "s3_bucket_replication_status" {
  description = "Terraform S3 Replication Status"
  type        = string
}

variable "s3_bucket_replication_storage_class" {
  description = "Terraform S3 Replication Object Storage Class"
  type        = string
}

variable "s3_bucket_tfstate_arn" {
  description = "S3 bucket ARN for replication partner"
  type        = string
}

variable "iam_role_replication_arn" {
  description = "ARN for IAM Role for S3 replication"
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
