/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "security_group_elb_id" {
  value = aws_security_group.elb.id
}

output "security_group_ec2_id" {
  value = aws_security_group.ec2.id
}
