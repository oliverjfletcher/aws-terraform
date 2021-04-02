/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "auto_scaling_group_name_0" {
  value = aws_autoscaling_group.auto_scaling_group_0.name
}

output "auto_scaling_policy_arn_0" {
  value = aws_autoscaling_policy.auto_scaling_policy_0.arn
}