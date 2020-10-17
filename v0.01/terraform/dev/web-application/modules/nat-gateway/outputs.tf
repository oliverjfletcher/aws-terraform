/**
 * AWS Terraform Demo
 */
########################################################################
# Define outputs for IAM Roles to be used by other Terraform modules
########################################################################
output "nat_gw_0_id"{
  value = aws_nat_gateway.nat_gw_0.id
}
output "nat_gw_1_id" {
  value = aws_nat_gateway.nat_gw_1.id
}                                 