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

variable "launch_configuration_encrypted" {
  description = "Encyrption configuration for the root device"
  type        = bool
}

variable "launch_configuration_iops" {
  description = "IOPs for root device defined within the launch configuration"
  type        = string
}

variable "launch_configuration_throughput" {
  description = "Throughput  for root device defined within the launch configuration"
  type        = string
}

variable "launch_configuration_volume_size" {
  description = "Volume size for root device defined within the launch configuration"
  type        = string
}

variable "launch_configuration_volume_type" {
  description = "Volume type for root device defined within the launch configuration"
  type        = string
}


variable "launch_configuration_http_tokens" {
  description = "Session token for instance metadata service"
  type        = string
}