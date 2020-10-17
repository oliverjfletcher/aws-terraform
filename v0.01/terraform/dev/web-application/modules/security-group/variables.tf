/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for VPC Subnets
########################################################################
variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "internet_cidr" {
  description = "Internet CIDR"
  type        = string
}

variable "subnet_pub_0_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_pub_1_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_pub_2_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_prv_0_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_prv_1_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_prv_2_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "port_http" {
  description = "Network ACL HTTP port"
  type        = number
}

variable "port_https" {
  description = "Network ACL HTTPS port"
  type        = number
}

variable "tcp_protocol" {
  description = "Network ACL TCP Protocol"
  type        = string
}

variable "sg_name_000" {
  description = "Security Group name"
  type        = string
}

variable "sg_description_000" {
  description = "Security group description"
  type        = string
}

variable "sg_name_001" {
  description = "Security Group name"
  type        = string
}

variable "sg_description_001" {
  description = "Security group description"
  type        = string
}

variable "sg_egress" {
  description = "Security egress rule type"
  type        = string
}

variable "sg_ingress" {
  description = "Security ingress rule type"
  type        = string
}