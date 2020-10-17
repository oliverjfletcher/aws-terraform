/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for Cloudwatch Log Group for VPC Flow Logs
########################################################################
variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map
}

variable "cloudwatch_log_group_name" {
  description = "Cloudwatch Log Group Name"
  type        = string
}

variable "cloudwatch_log_group_retention" {
  description = "Cloudwatch Log Group Retention"
  type        = number
}

variable "kms_key_id" {
  description = "KMS Key ID"
  type        = string
}

variable "auto_scaling_policy_arn" {
  description = "Autoscaling policy ARN"
  type        = string
}

variable "auto_scaling_group_name" {
  description = "Auto Scaling Name"
  type        = string
}

variable "cloudwatch_alarm_name" {
  description = "CloudWatch Alarm name"
  type        = string
}

variable "cloudwatch_alarm_comparison" {
  description = "CloudWatch Alarm comparison metric"
  type        = string
}

variable "cloudwatch_evaluation_periods" {
  description = "CloudWatch Alarm evaluation period"
  type        = string
}

variable "cloudwatch_metric_name" {
  description = "CloudWatch Alarm metric name"
  type        = string
}

variable "cloudwatch_namespace" {
  description = "CloudWatch Alarm namespace"
  type        = string
}

variable "cloudwatch_alarm_period" {
  description = "CloudWatch Alarm period"
  type        = string
}

variable "cloudwatch_alarm_statistic" {
  description = "CloudWatch Alarm statistic"
  type        = string
}

variable "cloudwatch_alarm_threshold" {
  description = "CloudWatch Alarm threshold"
  type        = string
}

