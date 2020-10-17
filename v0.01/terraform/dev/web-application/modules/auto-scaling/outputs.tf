/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "auto_scaling_group_name" {
  value = aws_autoscaling_group.auto_scaling_group.name
}

output "auto_scaling_policy_arn" {
  value = aws_autoscaling_policy.auto_scaling_policy.arn
}