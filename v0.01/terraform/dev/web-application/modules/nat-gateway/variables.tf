/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for NAT Gateway
########################################################################
variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map
}

variable "subnet_pub_0_id" {
  description = "Subnet ID"
  type        = string
}

variable "subnet_pub_1_id" {
  description = "Subnet ID"
  type        = string
}

variable "nat_gw_name_000" {
  description = "NAT Gateway Name"
  type        = string
}
variable "nat_gw_name_001" {
  description = "NAT Gateway Name"
  type        = string
}

variable "vpc_enabled" {
  description = "EIP VPC enabled"
  type        = bool
}