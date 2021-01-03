/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for VPC Subnets
########################################################################
variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map(any)
}

variable "map_public_ip_on_launch" {
  description = "Map public IP to instances on launch"
  type        = bool
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_pub_0_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_pub_1_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_pub_2_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_prv_0_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_prv_1_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_prv_2_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_pub_0_az" {
  description = "Subnet Availability Zone"
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

variable "subnet_pub_1_az" {
  description = "Subnet Availability Zone"
  type        = string
}

variable "subnet_pub_2_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_pub_2_az" {
  description = "Subnet Availability Zone"
  type        = string
}

variable "subnet_prv_0_az" {
  description = "Subnet Availability Zone"
  type        = string
}

variable "subnet_prv_0_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_prv_1_az" {
  description = "Subnet Availability Zone"
  type        = string
}

variable "subnet_prv_1_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_prv_2_az" {
  description = "Subnet Availability Zone"
  type        = string
}

variable "subnet_prv_2_cidr" {
  description = "Subnet CIDR"
  type        = string
}
