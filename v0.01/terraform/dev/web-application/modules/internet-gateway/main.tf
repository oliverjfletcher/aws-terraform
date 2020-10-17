/**
 * AWS Terraform Demo
 */
######################################################################
# Define Internet Gateway for Public Subnets
######################################################################
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.vpc_id
  tags = merge(
      {
        "name" = var.internet_gateway_name
      },
      var.standard_tags,
      )
}