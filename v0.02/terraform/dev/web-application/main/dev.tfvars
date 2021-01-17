/**
 * AWS Terraform Demo - Variables
 */
##########################################################################################
# Define values for variables to be used for Amazon Web Services Region and Credentials
##########################################################################################
aws_region_001       = "us-west-2"
sts_duration         = "300"
service_account_role = "arn:aws:iam::798376091767:role/terraform"
##########################################################################################
# Define values for tags for Amazon Web Services Resources
##########################################################################################
standard_tags = {
  department  = "engineering"
  contact     = "oliverjamesfletcher@protonmail.com"
  environment = "development"
}
##########################################################################################
# Define values for variables to be used for VPC
##########################################################################################
vpc_name             = "usevpc001"
vpc_cidr             = "10.0.64.0/19"
enable_dns_hostnames = "true"
enable_dns_support   = "true"
########################################################################
# Define values to be used for VPC Flow Logs to be provisioned
########################################################################
flow_logs_name = "vpcfld001"
traffic_type   = "ALL"
########################################################################
# Define values to be used for VPC Subnets to be provisioned
########################################################################
map_public_ip_on_launch = "false"
subnet_pub_0_name       = "usedsubpub000"
subnet_pub_1_name       = "usedsubpub001"
subnet_pub_2_name       = "usedsubpub002"
subnet_prv_0_name       = "usedsubprv000"
subnet_prv_1_name       = "usedsubprv001"
subnet_prv_2_name       = "usedsubprv002"
subnet_pub_0_az         = "us-west-2a"
subnet_pub_1_az         = "us-west-2b"
subnet_pub_2_az         = "us-west-2c"
subnet_pub_0_cidr       = "10.0.84.0/23"
subnet_pub_1_cidr       = "10.0.86.0/23"
subnet_pub_2_cidr       = "10.0.88.0/23"
subnet_prv_0_az         = "us-west-2a"
subnet_prv_1_az         = "us-west-2b"
subnet_prv_2_az         = "us-west-2c"
subnet_prv_0_cidr       = "10.0.90.0/23"
subnet_prv_1_cidr       = "10.0.92.0/23"
subnet_prv_2_cidr       = "10.0.94.0/23"
########################################################################
# Define values to be used for Route Tables to be provisioned
########################################################################
internet_cidr = "0.0.0.0/0"
########################################################################
# Define values to be used for IGW & NGW to be provisioned
########################################################################
internet_gateway_name = "usedigw000"
nat_gw_name_000       = "usednatgw000"
nat_gw_name_001       = "usednatgw001"
vpc_enabled           = "true"
##########################################################################
# Define values for variables to be used for Security Groups
##########################################################################
sg_name_000        = "usedsgpub000"
sg_description_000 = "alb security group"
sg_name_001        = "usedsgprv001"
sg_description_001 = "ec2 app security group"
sg_name_002        = "usedsgpub001"
sg_description_002 = "ec2 bastion security group"
sg_egress          = "ingress"
sg_ingress         = "egress"
port_http          = "80"
port_https         = "443"
port_ssh           = "22"
tcp_protocol       = "tcp"
###########################################################################
# Define values to be used for CloudWatch to be provisioned
###########################################################################
cloudwatch_log_group_name      = "clwdvpcfl001"
cloudwatch_log_group_retention = "365"
cloudwatch_alarm_name          = "usedcwa000"
cloudwatch_alarm_comparison    = "GreaterThanOrEqualToThreshold"
cloudwatch_evaluation_periods  = "1"
cloudwatch_metric_name         = "CPUUtilization"
cloudwatch_namespace           = "AWS/EC2"
cloudwatch_alarm_period        = "60"
cloudwatch_alarm_statistic     = "Maximum"
cloudwatch_alarm_threshold     = "80"
###########################################################################
# Define values to be used for IAM Roles to be provisioned
###########################################################################
iam_flow_logs_assume_role = "flowlogassume"
iam_flow_logs_policy      = "flowlogpolicy"
###########################################################################
# Define values for variables to be used for KMS keys
###########################################################################
kms_deletion_window_in_days = "14"
kms_enable_key_rotation     = "true"
kms_description             = "cloudwatch vpc flow logs kms key"
##########################################################################
# Define values to be used for IAM Roles to be provisioned
##########################################################################
elb_name                   = "usedelb000"
elb_type                   = "application"
enable_deletion_protection = "true"
elb_target_group_name      = "usedelbtg000"
http_protocol              = "HTTP"
health_check_enabled       = "true"
health_check_interval      = "10"
health_check_path          = "/"
health_check_port          = "80"
health_check_protocol      = "HTTP"
health_check_timeout       = "5"
health_check_matcher       = "200"
##########################################################################
# Define values to be used for Auto Scaling to be provisioned
##########################################################################
auto_scaling_group_name                 = "usedasg000"
auto_scaling_group_max_size             = "6"
auto_scaling_group_min_size             = "3"
auto_scaling_group_health_check_grace   = "300"
auto_scaling_group_health_check_type    = "ELB"
auto_scaling_group_force_delete         = "true"
auto_scaling_group_termination_policies = "OldestInstance"
auto_scaling_policy_name                = "usedasg000"
auto_scaling_adjustment                 = "1"
auto_scaling_adjustment_type            = "ChangeInCapacity"
##########################################################################
# Define values to be used for Auto Scaling to be provisioned
##########################################################################
launch_configuration_name              = "usedlcasg000"
launch_configuration_image_id          = "ami-067f5c3d5a99edc80"
launch_configuration_instance_type     = "t2.micro"
launch_configuration_key_name          = "0a6c45e4812a29026"
launch_configuration_monitoring        = "true"
launch_configuration_public_ip_address = "false"