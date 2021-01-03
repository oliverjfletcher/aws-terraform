/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for VPC Flow Logs
########################################################################
variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map(any)
}

variable "flow_logs_name" {
  description = "VPC Flow Logs Name for Tag"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "flow_logs_cloudwatch_role" {
  description = "Flow Log Cloud Watch IAM Role ARN"
  type        = string
}

variable "cloudwatch_group_arn" {
  description = "Cloud Watch Group ARN"
  type        = string
}

variable "traffic_type" {
  description = "Traffic to be captured by VPC Flow Logs"
  type        = string
}


