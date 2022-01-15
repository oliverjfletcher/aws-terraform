/**
 * AWS Terraform Demo - Main
 */
######################################################################
# Define AWS Terraform Provider, Credentials, Project and Region
######################################################################
provider "aws" {
  region = var.aws_region_001
  assume_role {
    role_arn = var.service_account_role
  }
}
######################################################################
# Define Terraform
######################################################################
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "useds3b000"
    key            = "global/s3/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state"
    encrypt        = true
  }
}
######################################################################
# Define AWS Resources
######################################################################
module "vpc" {
  source               = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/vpc"
  vpc_name             = var.vpc_name
  standard_tags        = var.standard_tags
  vpc_cidr             = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}

module "flow_log" {
  source                    = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/flow_log"
  standard_tags             = var.standard_tags
  flow_logs_name            = var.flow_logs_name
  traffic_type              = var.traffic_type
  flow_logs_cloudwatch_role = module.iam.flow_logs_cloudwatch_role
  cloudwatch_group_arn      = module.cloudwatch.cloudwatch_log_group_arn
  vpc_id                    = module.vpc.vpc_id
}

module "subnet" {
  source                  = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/subnet"
  standard_tags           = var.standard_tags
  map_public_ip_on_launch = var.map_public_ip_on_launch
  subnet_pub_0_name       = var.subnet_pub_0_name
  subnet_pub_1_name       = var.subnet_pub_1_name
  subnet_pub_2_name       = var.subnet_pub_2_name
  subnet_prv_0_name       = var.subnet_prv_0_name
  subnet_prv_1_name       = var.subnet_prv_1_name
  subnet_prv_2_name       = var.subnet_prv_2_name
  subnet_pub_0_az         = var.subnet_pub_0_az
  subnet_pub_1_az         = var.subnet_pub_1_az
  subnet_pub_2_az         = var.subnet_pub_2_az
  subnet_pub_0_cidr       = var.subnet_pub_0_cidr
  subnet_pub_1_cidr       = var.subnet_pub_1_cidr
  subnet_pub_2_cidr       = var.subnet_pub_2_cidr
  subnet_prv_0_az         = var.subnet_prv_0_az
  subnet_prv_1_az         = var.subnet_prv_1_az
  subnet_prv_2_az         = var.subnet_prv_2_az
  subnet_prv_0_cidr       = var.subnet_prv_0_cidr
  subnet_prv_1_cidr       = var.subnet_prv_1_cidr
  subnet_prv_2_cidr       = var.subnet_prv_2_cidr
  vpc_id                  = module.vpc.vpc_id
}

module "security_group" {
  source             = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/security_group"
  standard_tags      = var.standard_tags
  sg_name_000        = var.sg_name_000
  sg_description_000 = var.sg_description_000
  sg_name_001        = var.sg_name_001
  sg_description_001 = var.sg_description_001
  subnet_pub_0_cidr  = var.subnet_pub_0_cidr
  subnet_pub_1_cidr  = var.subnet_pub_1_cidr
  subnet_pub_2_cidr  = var.subnet_pub_2_cidr
  subnet_prv_0_cidr  = var.subnet_prv_0_cidr
  subnet_prv_1_cidr  = var.subnet_prv_1_cidr
  subnet_prv_2_cidr  = var.subnet_prv_2_cidr
  internet_cidr      = var.internet_cidr
  port_http          = var.port_http
  port_https         = var.port_https
  tcp_protocol       = var.tcp_protocol
  vpc_id             = module.vpc.vpc_id
  sg_egress          = var.sg_egress
  sg_ingress         = var.sg_ingress

}

module "route_table" {
  source              = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/route_table"
  subnet_pub_0_id     = module.subnet.subnet_public_0_id
  subnet_pub_1_id     = module.subnet.subnet_public_1_id
  subnet_pub_2_id     = module.subnet.subnet_public_2_id
  subnet_prv_0_id     = module.subnet.subnet_private_0_id
  subnet_prv_1_id     = module.subnet.subnet_private_1_id
  subnet_prv_2_id     = module.subnet.subnet_private_2_id
  internet_cidr       = var.internet_cidr
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  nat_gw_0_id         = module.nat_gateway.nat_gw_0_id
  nat_gw_1_id         = module.nat_gateway.nat_gw_1_id
  vpc_id              = module.vpc.vpc_id
}

module "internet_gateway" {
  source                = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/internet_gateway"
  internet_gateway_name = var.internet_gateway_name
  vpc_id                = module.vpc.vpc_id
  standard_tags         = var.standard_tags
}

module "nat_gateway" {
  source          = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/nat_gateway"
  nat_gw_name_000 = var.nat_gw_name_000
  nat_gw_name_001 = var.nat_gw_name_001
  subnet_pub_0_id = module.subnet.subnet_public_0_id
  subnet_pub_1_id = module.subnet.subnet_public_1_id
  standard_tags   = var.standard_tags
  vpc_enabled     = var.vpc_enabled
}

module "elb" {
  source                     = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/elb"
  standard_tags              = var.standard_tags
  elb_name                   = var.elb_name
  elb_type                   = var.elb_type
  vpc_id                     = module.vpc.vpc_id
  security_group_elb_id      = module.security_group.security_group_elb_id
  subnet_pub_0_id            = module.subnet.subnet_public_0_id
  subnet_pub_1_id            = module.subnet.subnet_public_1_id
  subnet_pub_2_id            = module.subnet.subnet_public_2_id
  enable_deletion_protection = var.enable_deletion_protection
  elb_target_group_name      = var.elb_target_group_name
  http_protocol              = var.http_protocol
  port_http                  = var.port_http
  health_check_enabled       = var.health_check_enabled
  health_check_interval      = var.health_check_interval
  health_check_path          = var.health_check_path
  health_check_port          = var.health_check_port
  health_check_protocol      = var.health_check_protocol
  health_check_timeout       = var.health_check_timeout
  health_check_matcher       = var.health_check_matcher
}

module "auto_scaling" {
  source                                  = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/auto_scaling"
  auto_scaling_group_name                 = var.auto_scaling_group_name
  auto_scaling_group_max_size             = var.auto_scaling_group_max_size
  auto_scaling_group_min_size             = var.auto_scaling_group_min_size
  auto_scaling_group_health_check_grace   = var.auto_scaling_group_health_check_grace
  auto_scaling_group_health_check_type    = var.auto_scaling_group_health_check_type
  auto_scaling_group_force_delete         = var.auto_scaling_group_force_delete
  auto_scaling_group_termination_policies = var.auto_scaling_group_termination_policies
  auto_scaling_policy_name                = var.auto_scaling_policy_name
  auto_scaling_adjustment                 = var.auto_scaling_adjustment
  auto_scaling_adjustment_type            = var.auto_scaling_adjustment_type
  elb_target_group_arn                    = module.elb.elb_target_group_arn
  elb_target_group_id                     = module.elb.elb_target_group_id
  launch_configuration_name               = module.launch_configuration.launch_configuration_name
  subnet_prv_0_id                         = module.subnet.subnet_private_0_id
  subnet_prv_1_id                         = module.subnet.subnet_private_1_id
  subnet_prv_2_id                         = module.subnet.subnet_private_2_id

}

module "launch_configuration" {
  source                                 = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/launch_configuration"
  launch_configuration_name              = var.launch_configuration_name
  launch_configuration_image_id          = var.launch_configuration_image_id
  launch_configuration_instance_type     = var.launch_configuration_instance_type
  launch_configuration_key_name          = var.launch_configuration_key_name
  security_group_ec2_id                  = module.security_group.security_group_ec2_id
  launch_configuration_monitoring        = var.launch_configuration_monitoring
  launch_configuration_public_ip_address = var.launch_configuration_public_ip_address
}


module "cloudwatch" {
  source                         = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/cloudwatch"
  standard_tags                  = var.standard_tags
  cloudwatch_log_group_name      = var.cloudwatch_log_group_name
  cloudwatch_log_group_retention = var.cloudwatch_log_group_retention
  kms_key_id                     = module.kms.kms_key_arn
  auto_scaling_group_name        = module.auto_scaling.auto_scaling_group_name
  auto_scaling_policy_arn        = module.auto_scaling.auto_scaling_policy_arn
  cloudwatch_alarm_name          = var.cloudwatch_alarm_name
  cloudwatch_alarm_comparison    = var.cloudwatch_alarm_comparison
  cloudwatch_evaluation_periods  = var.cloudwatch_evaluation_periods
  cloudwatch_metric_name         = var.cloudwatch_metric_name
  cloudwatch_namespace           = var.cloudwatch_namespace
  cloudwatch_alarm_period        = var.cloudwatch_alarm_period
  cloudwatch_alarm_statistic     = var.cloudwatch_alarm_statistic
  cloudwatch_alarm_threshold     = var.cloudwatch_alarm_threshold
}

module "iam" {
  source                    = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/iam"
  iam_flow_logs_assume_role = var.iam_flow_logs_assume_role
  iam_flow_logs_policy      = var.iam_flow_logs_policy
}

module "kms" {
  source                      = "github.com/oliverjfletcher/aws-terraform/env/web-application/modules/kms"
  aws_region_001              = var.aws_region_001
  kms_deletion_window_in_days = var.kms_deletion_window_in_days
  kms_enable_key_rotation     = var.kms_enable_key_rotation
  cloudwatch_log_group_name   = var.cloudwatch_log_group_name
  standard_tags               = var.standard_tags
  kms_description             = var.kms_description
}

######################################################################
# Define Outputs from Modules to be used
######################################################################
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID"
}

output "subnet_public_0_id" {
  value       = module.subnet.subnet_public_0_id
  description = "Subnet ID"
}

output "subnet_public_1_id" {
  value       = module.subnet.subnet_public_1_id
  description = "Subnet ID"
}

output "subnet_public_2_id" {
  value       = module.subnet.subnet_public_2_id
  description = "Subnet ID"
}

output "subnet_private_0_id" {
  value       = module.subnet.subnet_private_0_id
  description = "Subnet ID"
}

output "subnet_private_1_id" {
  value       = module.subnet.subnet_private_1_id
  description = "Subnet ID"
}

output "subnet_private_2_id" {
  value       = module.subnet.subnet_private_2_id
  description = "Subnet ID"
}

output "internet_gateway_id" {
  value       = module.internet_gateway.internet_gateway_id
  description = "Subnet ID"
}

output "nat_gw_0_id" {
  value = module.nat_gateway.nat_gw_0_id
}

output "nat_gw_1_id" {
  value = module.nat_gateway.nat_gw_1_id
}

output "elb_target_group_arn" {
  value = module.elb.elb_target_group_arn
}

output "elb_target_group_id" {
  value = module.elb.elb_target_group_id
}

output "auto_scaling_group_name" {
  value = module.auto_scaling.auto_scaling_group_name
}

output "auto_scaling_policy_arn" {
  value = module.auto_scaling.auto_scaling_policy_arn
}

output "launch_configuration_name" {
  value = module.launch_configuration.launch_configuration_name
}

output "security_group_elb_id" {
  value = module.security_group.security_group_elb_id
}

output "security_group_ec2_id" {
  value = module.security_group.security_group_ec2_id
}

output "cloudwatch_log_group_arn" {
  value       = module.cloudwatch.cloudwatch_log_group_arn
  description = "ARN for CloudWatch Log Group for VPC Flow Logs"
}

output "flow_logs_cloudwatch_role" {
  value       = module.iam.flow_logs_cloudwatch_role
  description = "ARN for IAM Role for VPC Flow Logs"
}

output "kms_key_arn" {
  value       = module.kms.kms_key_arn
  description = "ARN for KMS Key for CloudWatch Log Group"
}