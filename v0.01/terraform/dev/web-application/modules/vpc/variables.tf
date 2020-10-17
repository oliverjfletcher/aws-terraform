/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for VPC
########################################################################
variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Enable DNS for hots in VPC"
  type        = bool
}

variable "enable_dns_support" {
  description = "Enable DNS for VPC"
  type        = bool
}