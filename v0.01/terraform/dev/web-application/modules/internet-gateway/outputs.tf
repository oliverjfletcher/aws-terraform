/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "internet_gateway_id"{
  value = aws_internet_gateway.internet_gateway.id
}
