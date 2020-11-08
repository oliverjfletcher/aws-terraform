/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for Cloudtrail
########################################################################
variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map
}

variable "cloudtrail_name" {
  description = "Cloud Trail Name"
  type        = string
}

variable "s3_cloudtrail_id" {
  description = "S3 Bucket ID for Cloudtrail"
  type        = string
}

variable "s3_cloudtrail_bucket_policy_id" {
  description = "S3 Bucket Policy ID for Cloudtrail"
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

variable "kms_key_arn_ct" {
  description = "KMS Key ARN for S3 Bucket"
  type        = string
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