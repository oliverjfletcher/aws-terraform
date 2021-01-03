/**
 * AWS Terraform Demo
 */
######################################################################
# Define Application Load Balancer for Web App
######################################################################
resource "aws_lb" "web_elb" {
  name               = var.elb_name
  load_balancer_type = var.elb_type
  security_groups    = [var.security_group_elb_id]
  subnets = [
    var.subnet_pub_0_id,
    var.subnet_pub_1_id,
    var.subnet_pub_2_id,
  ]
  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(
    {
      "name" = var.elb_name
    },
    var.standard_tags,
  )
}

resource "aws_lb_target_group" "target_group" {
  name     = var.elb_target_group_name
  port     = var.port_http
  protocol = var.http_protocol
  vpc_id   = var.vpc_id
  health_check {
    enabled  = var.health_check_enabled
    interval = var.health_check_interval
    path     = var.health_check_path
    port     = var.health_check_port
    protocol = var.health_check_protocol
    timeout  = var.health_check_timeout
    matcher  = var.health_check_matcher
  }

  tags = merge(
    {
      "name" = var.elb_target_group_name
    },
    var.standard_tags,
  )
}

resource "aws_lb_listener" "elb-listener" {
  load_balancer_arn = aws_lb.web_elb.arn
  port              = var.port_http
  protocol          = var.http_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
