/**
 * AWS Terraform Demo
 */
######################################################################
# Define Route Tables for Subnets to NAT and IGW
######################################################################
resource "aws_route_table" "internet_gateway_rt_0" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.internet_cidr
    gateway_id = var.internet_gateway_id
  }
}

resource "aws_route_table_association" "internet_gateway_rta_0" {
  subnet_id = var.subnet_pub_0_id
  route_table_id = aws_route_table.internet_gateway_rt_0.id
  depends_on = [
    var.internet_gateway_id
  ]
}

resource "aws_route_table_association" "internet_gateway_rta_1" {
  subnet_id = var.subnet_pub_1_id
  route_table_id = aws_route_table.internet_gateway_rt_0.id
  depends_on = [
    var.internet_gateway_id
  ]
}

resource "aws_route_table_association" "internet_gateway_rta_2" {
  subnet_id = var.subnet_pub_2_id
  route_table_id = aws_route_table.internet_gateway_rt_0.id
  depends_on = [
    var.internet_gateway_id
  ]
}

resource "aws_route_table" "nat_gateway_rt_0" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = var.internet_cidr
    nat_gateway_id = var.nat_gw_0_id
  }
  depends_on = [
    var.nat_gw_0_id
  ]
}

resource "aws_route_table" "nat_gateway_rt_1" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = var.internet_cidr
    nat_gateway_id = var.nat_gw_1_id
  }
  depends_on = [
    var.nat_gw_1_id
  ]
}

resource "aws_route_table_association" "nat-gateway-pub-0" {
  subnet_id = var.subnet_prv_0_id
  route_table_id = aws_route_table.nat_gateway_rt_0.id
  depends_on = [
    var.nat_gw_0_id
  ]
}

resource "aws_route_table_association" "nat-gateway-pub-1" {
  subnet_id = var.subnet_prv_1_id
  route_table_id = aws_route_table.nat_gateway_rt_0.id
  depends_on = [
    var.nat_gw_0_id
  ]
}

resource "aws_route_table_association" "nat-gateway-pub-2" {
  subnet_id = var.subnet_prv_2_id
  route_table_id = aws_route_table.nat_gateway_rt_1.id
  depends_on = [
    var.nat_gw_1_id
  ]
}