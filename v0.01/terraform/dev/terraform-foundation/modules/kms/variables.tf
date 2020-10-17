/**
 * AWS Terraform Demo
 */
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

variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map
}

variable "kms_description" {
  description = "KMS key description"
  type        = string
}



