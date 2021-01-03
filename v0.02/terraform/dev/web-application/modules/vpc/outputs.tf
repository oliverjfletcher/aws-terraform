/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "vpc_id" {
  value = aws_vpc.vpc.id
}