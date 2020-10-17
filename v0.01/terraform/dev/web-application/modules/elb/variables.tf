/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for ELB
########################################################################
variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "elb_name" {
  description = "ELB Name"
  type        = string
}

variable "elb_type" {
  description = "ELB type"
  type        = string
}

variable "security_group_elb_id" {
  description = "Security Group for ELB ID"
  type        = string
}

variable "subnet_pub_0_id" {
  description = "Subnet ID"
  type        = string
}

variable "subnet_pub_1_id" {
  description = "Subnet ID"
  type        = string
}

variable "subnet_pub_2_id" {
  description = "Subnet ID"
  type        = string
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for ELB"
  type        = bool
}

variable "elb_target_group_name" {
  description = "ELB Target group name"
  type        = string
}

variable "port_http" {
  description = "Port 80"
  type        = string
}

variable "http_protocol" {
  description = "HTTP Protocol"
  type        = string
}

variable "health_check_enabled" {
  description = "Health Check enable"
  type        = string
}

variable "health_check_interval" {
  description = "Health Check Interval"
  type        = string
}

variable "health_check_path" {
  description = "Health Check Path"
  type        = string
}

variable "health_check_port" {
  description = "Health Check Port"
  type        = string
}

variable "health_check_protocol" {
  description = "Health Check Protocol"
  type        = string
}

variable "health_check_timeout" {
  description = "Health Check Timeout"
  type        = string
}

variable "health_check_matcher" {
  description = "Health Check Matcher"
  type        = string
}