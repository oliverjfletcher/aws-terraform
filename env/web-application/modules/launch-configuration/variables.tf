/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for Launch Configuration
########################################################################
variable "security_group_ec2_id" {
  description = "EC2 Security Group"
  type        = string
}

variable "launch_configuration_name" {
  description = "Launch Configuration Name"
  type        = string
}

variable "launch_configuration_image_id" {
  description = "Launch Configuration image ID"
  type        = string
}

variable "launch_configuration_instance_type" {
  description = "Launch Configuration instance type"
  type        = string
}

variable "launch_configuration_key_name" {
  description = "Launch Configuration key name"
  type        = string
}

variable "launch_configuration_monitoring" {
  description = "Launch Configuration instance monitoring"
  type        = bool
}

variable "launch_configuration_public_ip_address" {
  description = "Launch Configuration instance monitoring"
  type        = bool
}


