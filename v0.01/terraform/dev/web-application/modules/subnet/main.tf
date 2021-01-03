/**
 * AWS Terraform Demo
 */
######################################################################
# Define Subnets for VPC
######################################################################
resource "aws_subnet" "public_0" {
  availability_zone       = var.subnet_pub_0_az
  map_public_ip_on_launch = var.map_public_ip_on_launch
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_pub_0_cidr
  tags = merge(
    {
      "name" = var.subnet_pub_0_name
    },
    var.standard_tags,
  )
}

resource "aws_subnet" "public_1" {
  availability_zone       = var.subnet_pub_1_az
  map_public_ip_on_launch = var.map_public_ip_on_launch
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_pub_1_cidr
  tags = merge(
    {
      "name" = var.subnet_pub_1_name
    },
    var.standard_tags,
  )
}

resource "aws_subnet" "public_2" {
  availability_zone       = var.subnet_pub_2_az
  map_public_ip_on_launch = var.map_public_ip_on_launch
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_pub_2_cidr
  tags = merge(
    {
      "name" = var.subnet_pub_2_name
    },
    var.standard_tags,
  )
}

resource "aws_subnet" "private_0" {
  availability_zone       = var.subnet_prv_0_az
  map_public_ip_on_launch = var.map_public_ip_on_launch
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_prv_0_cidr
  tags = merge(
    {
      "name" = var.subnet_prv_0_name
    },
    var.standard_tags,
  )
}

resource "aws_subnet" "private_1" {
  availability_zone       = var.subnet_prv_1_az
  map_public_ip_on_launch = var.map_public_ip_on_launch
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_prv_1_cidr
  tags = merge(
    {
      "name" = var.subnet_prv_1_name
    },
    var.standard_tags,
  )
}

resource "aws_subnet" "private_2" {
  availability_zone       = var.subnet_prv_2_az
  map_public_ip_on_launch = var.map_public_ip_on_launch
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_prv_2_cidr
  tags = merge(
    {
      "name" = var.subnet_prv_1_name
    },
    var.standard_tags,
  )
}