/**
 * AWS Terraform Demo
 */
######################################################################
# Define Security Groups
######################################################################
resource "aws_security_group" "elb" {
  name        = var.sg_name_000
  description = var.sg_description_000
  vpc_id      = var.vpc_id

  ingress {
    description = var.sg_description_000
    from_port   = var.port_http
    to_port     = var.port_http
    protocol    = var.tcp_protocol
    cidr_blocks = [
      var.internet_cidr
    ]
  }

  egress {
    from_port = var.port_http
    to_port   = var.port_http
    protocol  = var.tcp_protocol
    cidr_blocks = [
      var.subnet_prv_0_cidr,
      var.subnet_prv_1_cidr,
      var.subnet_prv_2_cidr,
    ]
  }

  tags = merge(
    {
      "name" = var.sg_name_000
    },
    var.standard_tags,
  )
}

resource "aws_security_group" "ec2" {
  name        = var.sg_name_001
  description = var.sg_description_001
  vpc_id      = var.vpc_id

  ingress {
    description = var.sg_description_001
    from_port   = var.port_http
    to_port     = var.port_http
    protocol    = var.tcp_protocol
    cidr_blocks = [
      var.subnet_pub_0_cidr,
      var.subnet_pub_1_cidr,
      var.subnet_pub_2_cidr
    ]
  }

  egress {
    from_port = var.port_http
    to_port   = var.port_http
    protocol  = var.tcp_protocol
    cidr_blocks = [
      var.internet_cidr
    ]
  }

  tags = merge(
    {
      "name" = var.sg_name_001
    },
    var.standard_tags,
  )
}

resource "aws_security_group_rule" "ec2-https-egress" {
  type      = var.sg_egress
  from_port = var.port_https
  to_port   = var.port_https
  protocol  = var.tcp_protocol
  cidr_blocks = [
    var.internet_cidr
  ]
  security_group_id = aws_security_group.ec2.id
  depends_on = [
    aws_security_group.ec2
  ]
}