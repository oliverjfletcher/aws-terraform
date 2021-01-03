/**
 * AWS Terraform Demo
 */
######################################################################
# Define HA NAT Gateways in Public Subnet
######################################################################
resource "aws_eip" "nat_gw_eip_0" {
  vpc = var.vpc_enabled
}

resource "aws_eip" "nat_gw_eip_1" {
  vpc = var.vpc_enabled
}

resource "aws_nat_gateway" "nat_gw_0" {
  allocation_id = aws_eip.nat_gw_eip_0.id
  subnet_id     = var.subnet_pub_0_id
  tags = merge(
    {
      "name" = var.nat_gw_name_000
    },
    var.standard_tags,
  )
}
resource "aws_nat_gateway" "nat_gw_1" {
  allocation_id = aws_eip.nat_gw_eip_1.id
  subnet_id     = var.subnet_pub_1_id
  tags = merge(
    {
      "name" = var.nat_gw_name_001
    },
    var.standard_tags,
  )
}



