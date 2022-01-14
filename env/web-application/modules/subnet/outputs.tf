/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "subnet_public_0_id" {
  value = aws_subnet.public_0.id
}
output "subnet_public_1_id" {
  value = aws_subnet.public_1.id
}
output "subnet_public_2_id" {
  value = aws_subnet.public_2.id
}
output "subnet_private_0_id" {
  value = aws_subnet.private_0.id
}
output "subnet_private_1_id" {
  value = aws_subnet.private_1.id
}
output "subnet_private_2_id" {
  value = aws_subnet.private_2.id
}

