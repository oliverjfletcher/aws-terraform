/**
 * AWS Terraform Demo
 */
######################################################################
# Define VPC
######################################################################
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = merge(
    {
      "name" = var.vpc_name
    },
    var.standard_tags,
  )
}