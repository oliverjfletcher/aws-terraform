/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for AWS resources to be provisioned
########################################################################
variable "aws_region_001" {
  description = "Definition of London AWS Region"
  type        = string
}

variable "aws_region_002" {
  description = "Definition of Ireland AWS Region"
  type        = string
}

variable "sts_duration" {
  description = "Definition of AWS Security Token Service ID"
  type        = string
}

variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map(any)
}

########################################################################
# Define variables to be used for S3 Bucket to be provisioned
########################################################################
variable "s3_bucket_name_001" {
  description = "Terraform State S3 Bucket"
  type        = string
}

variable "s3_bucket_name_002" {
  description = "Terraform State S3 Bucket"
  type        = string
}

variable "s3_bucket_name_003" {
  description = "Cloud Trail S3 Bucket"
  type        = string
}

variable "s3_bucket_acl" {
  description = "Terraform State S3 Bucket ACL"
  type        = string
}

variable "s3_bucket_versioning" {
  description = "Terraform State S3 Bucket Versioning"
  type        = string
  default     = true
}

variable "s3_mfa_delete" {
  description = "Enable MFA for S3 Delete"
  type        = bool
  default     = true
}

variable "s3_bucket_lifecycle" {
  description = "Terraform State S3 Bucket Lifecycle"
  type        = bool
  default     = true
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

########################################################################
# Define variables to be used for DynamoDb table to be provisioned
########################################################################
variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  type        = string
}

variable "dynamodb_table_read_capacity" {
  description = "DynamoDB table read capacity"
  type        = number
}

variable "dynamodb_table_write_capacity" {
  description = "DynamoDB table write capacity"
  type        = number
}

variable "dynamodb_table_hash_key" {
  description = "DynamoDB hash key"
  type        = string
}

variable "attribute" {
  description = "DynamoDB table attributes"
  type        = list(object({ name = string, type = string }))
}

########################################################################
# Define variables to be used for IAM resources to be provisioned
########################################################################
variable "iam_role_name_001" {
  description = "Terraform State Bucket Replication IAM Role Name"
  type        = string
}

variable "iam_policy_name_001" {
  description = "Terraform State Bucket Replication IAM Policy Name"
  type        = string
}

########################################################################
# Define variables to be used for KMS Key to be provisioned
########################################################################
variable "kms_deletion_window_in_days" {
  description = "Deletion time for key"
  type        = string
}

variable "kms_enable_key_rotation" {
  description = "Enable KMS key rotation"
  type        = bool
}

variable "kms_description_ct" {
  description = "KMS key description"
  type        = string
}

variable "kms_description_tf" {
  description = "KMS key description"
  type        = string
}

########################################################################
# Define variables to be used for Cloudtrail
########################################################################
variable "cloudtrail_name" {
  description = "Cloud Trail Name"
  type        = string
}

variable "s3_cloudtrail_prefix" {
  description = "S3 Bucket object prefix"
  type        = string
}

variable "include_global_service_event" {
  description = "Include all AWS services for Cloudtrail logs"
  type        = bool
}

variable "enable_log_file_validation" {
  description = "Enable log file integrity validation"
  type        = bool
}

variable "enable_logging" {
  description = "Enable Cloudtrail logging"
  type        = bool
}

variable "is_multi_region_trail" {
  description = "Enable Cloudtrail to run across multiple regions"
  type        = bool
}

variable "is_organization_trail" {
  description = "Enable Cloudtrail for AWS Organisation"
  type        = bool
}

variable "read_write_type" {
  description = "Enable read and or write events to be logged in CloudTrail"
  type        = string
}

variable "include_management_events" {
  description = "Enable management events to be logged in CloudTrail"
  type        = bool
}

variable "data_resource_type" {
  description = "Enable data events to be logged in CloudTrail"
  type        = string
}

variable "data_resource_values" {
  description = "Data events type to be logged in Cloudtrail"
  type        = string
}