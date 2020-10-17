/**
 * AWS Terraform Demo
 */
########################################################################
# Define variables to be used for AWS resources to be provisioned
########################################################################
variable "aws_region_001" {
  description = "Definition of London AWS Region"
  type        = string
}

variable "sts_duration" {
  description = "Definition of AWS Security Token Service ID"
  type        = string
}

variable "standard_tags" {
  description = "Standards tags to be used for all AWS Resources"
  type        = map
}
########################################################################
# Define variables to be used for VPC
########################################################################
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
########################################################################
# Define variables to be used for VPC Flow Logs
########################################################################
variable "traffic_type" {
  description = "Traffic to be captured by VPC Flow Logs"
  type        = string
}

variable "flow_logs_name" {
  description = "VPC Flow Logs Name for Tag"
  type        = string
}
########################################################################
# Define variables to be used for VPC Subnets
########################################################################
variable "map_public_ip_on_launch" {
  description = "Map public IP to instances on launch"
  type        = bool
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
########################################################################
# Define variables to be used for Route Tables to be provisioned
########################################################################
variable "internet_cidr" {
  description = "Internet CIDR"
  type        = string
}
########################################################################
# Define variables to be used for IGW & NGW
########################################################################
variable "internet_gateway_name" {
  description = "Internet Gateway Name"
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

######################################################################
# Define variables to be used for Security Groups
######################################################################

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

variable "sg_name_002" {
  description = "Security Group name"
  type        = string
}

variable "sg_description_002" {
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

variable "port_http" {
  description = "HTTP port"
  type        = number
}

variable "port_https" {
  description = "HTTPS port"
  type        = number
}

variable "port_ssh" {
  description = "SSH port"
  type        = number
}

variable "tcp_protocol" {
  description = "TCP Protocol"
  type        = string
}

########################################################################
# Define variables to be used for IAM Roles to be provisioned
########################################################################
variable "iam_flow_logs_assume_role" {
  description = "VPC Flow Logs Assume IAM Role Name"
  type        = string
}

variable "iam_flow_logs_policy" {
  description = "VPC Flow Logs Assume IAM Policy Name"
  type        = string
}
########################################################################
# Define variables to be used for CloudWatch to be provisioned
########################################################################
variable "cloudwatch_log_group_name" {
  description = "Cloudwatch Log Group Name"
  type        = string
}

variable "cloudwatch_log_group_retention" {
  description = "Cloudwatch Log Group Retention"
  type        = number
}

variable "cloudwatch_alarm_name" {
  description = "CloudWatch Alarm name"
  type        = string
}

variable "cloudwatch_alarm_comparison" {
  description = "CloudWatch Alarm comparison metric"
  type        = string
}

variable "cloudwatch_evaluation_periods" {
  description = "CloudWatch Alarm evaluation period"
  type        = string
}

variable "cloudwatch_metric_name" {
  description = "CloudWatch Alarm metric name"
  type        = string
}

variable "cloudwatch_namespace" {
  description = "CloudWatch Alarm namespace"
  type        = string
}

variable "cloudwatch_alarm_period" {
  description = "CloudWatch Alarm period"
  type        = string
}

variable "cloudwatch_alarm_statistic" {
  description = "CloudWatch Alarm statistic"
  type        = string
}

variable "cloudwatch_alarm_threshold" {
  description = "CloudWatch Alarm threshold"
  type        = string
}

########################################################################
# Define variables to be used for KMS Key to be provisioned
########################################################################
variable "kms_deletion_window_in_days" {
  description = "Deletion time for key"
  type        = string
}

variable "kms_enable_key_rotation" {
  description = "Enable KMS key rotation"
  type        = bool
}

variable "kms_description" {
  description = "KMS key description"
  type        = string
}

########################################################################
# Define variables to be used for ELB to be provisioned
########################################################################
variable "elb_name" {
  description = "ELB Name"
  type        = string
}

variable "elb_type" {
  description = "ELB type"
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

########################################################################
# Define variables to be used for Auto Scaling to be provisioned
########################################################################

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

########################################################################
# Define variables to be used for Launch Configuration to be provisioned
########################################################################

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
