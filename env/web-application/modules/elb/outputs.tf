/**
 * Onica DevOps Test
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "elb_target_group_arn" {
  value = aws_lb_target_group.target_group.arn
}
output "elb_target_group_id" {
  value = aws_lb_target_group.target_group.id
}