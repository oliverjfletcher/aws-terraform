/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for IAM Roles to be provisioned
########################################################################
variable "iam_role_name_001" {
  description = "Terraform State Bucket Replication IAM Role Name"
  type        = string
}

variable "iam_policy_name_001" {
  description = "Terraform State Bucket Replication IAM Policy Name"
  type        = string
}

variable "s3_bucket_name_001" {
  description = "Terraform State S3 Bucket"
  type        = string
}

variable "s3_bucket_name_002" {
  description = "Terraform State S3 Bucket"
  type        = string
}
