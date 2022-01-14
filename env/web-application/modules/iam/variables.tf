/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for IAM Roles to be provisioned
########################################################################
variable "iam_flow_logs_assume_role" {
  description = "VPC Flow Logs Assume IAM Role Name"
  type        = string
}

variable "iam_flow_logs_policy" {
  description = "VPC Flow Logs Assume IAM Policy Name"
  type        = string
}