/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for Internet Gateway
########################################################################
variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map(any)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "internet_gateway_name" {
  description = "Internet Gateway Name"
  type        = string
}