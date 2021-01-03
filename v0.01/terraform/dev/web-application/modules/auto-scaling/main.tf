/**
 * AWS Terraform Demo
 */
######################################################################
# Define Auto Scaling Group
######################################################################
resource "aws_autoscaling_group" "auto_scaling_group" {
  name                      = var.auto_scaling_group_name
  max_size                  = var.auto_scaling_group_max_size
  min_size                  = var.auto_scaling_group_min_size
  health_check_grace_period = var.auto_scaling_group_health_check_grace
  health_check_type         = var.auto_scaling_group_health_check_type
  force_delete              = var.auto_scaling_group_force_delete
  vpc_zone_identifier       = [var.subnet_prv_0_id, var.subnet_prv_1_id, var.subnet_prv_2_id]
  target_group_arns         = [var.elb_target_group_arn]
  termination_policies      = [var.auto_scaling_group_termination_policies]
  launch_configuration      = var.launch_configuration_name

}
######################################################################
# Define Auto Scaling Group Policy
######################################################################

resource "aws_autoscaling_policy" "auto_scaling_policy" {
  name                   = var.auto_scaling_policy_name
  scaling_adjustment     = var.auto_scaling_adjustment
  adjustment_type        = var.auto_scaling_adjustment_type
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.name
}