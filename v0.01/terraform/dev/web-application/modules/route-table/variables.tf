/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for VPC Subnets
########################################################################
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "internet_gateway_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "internet_cidr" {
  description = "Internet CIDR"
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

variable "nat_gw_0_id" {
  description = "NAT GW 0 ID"
  type        = string
}

variable "nat_gw_1_id" {
  description = "NAT GW 1 ID"
  type        = string
}