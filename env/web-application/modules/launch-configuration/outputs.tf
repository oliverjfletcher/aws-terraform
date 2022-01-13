/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "launch_configuration_name" {
  value = aws_launch_configuration.launch_configuration.name
}  