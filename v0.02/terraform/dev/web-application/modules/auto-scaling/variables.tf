/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for Auto Scaling
########################################################################
variable "elb_target_group_arn" {
  description = "ELB ARN"
  type        = string
}

variable "elb_target_group_id" {
  description = "ELB ID"
  type        = string
}

variable "launch_configuration_name" {
  description = "Launch Configuration name"
  type        = string
}

variable "subnet_prv_0_id" {
  description = "Subnet ID"
  type        = string
}

variable "subnet_prv_1_id" {
  description = "Subnet ID"
  type        = string
}

variable "subnet_prv_2_id" {
  description = "Subnet ID"
  type        = string
}

variable "auto_scaling_group_name" {
  description = "Auto Scaling Name"
  type        = string
}

variable "auto_scaling_group_max_size" {
  description = "Auto Scaling Max Size"
  type        = string
}

variable "auto_scaling_group_min_size" {
  description = "Auto Scaling Min Size"
  type        = string
}

variable "auto_scaling_group_health_check_grace" {
  description = "Auto Scaling check grace period"
  type        = string
}

variable "auto_scaling_group_health_check_type" {
  description = "Auto Scaling check type"
  type        = string
}

variable "auto_scaling_group_force_delete" {
  description = "Auto Scaling force delete"
  type        = string
}

variable "auto_scaling_group_termination_policies" {
  description = "Auto Scaling termination policy"
  type        = string
}

variable "auto_scaling_policy_name" {
  description = "Auto Scaling policy name"
  type        = string
}

variable "auto_scaling_adjustment" {
  description = "Auto Scaling scaling adjustment"
  type        = string
}

variable "auto_scaling_adjustment_type" {
  description = "Auto Scaling adjustment type"
  type        = string
}