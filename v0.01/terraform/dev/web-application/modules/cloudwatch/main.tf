/**
 * AWS Terraform Demo
 */
######################################################################
# Define CloudWatch Log Group for VPC Flow Logs
######################################################################
resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name              = var.cloudwatch_log_group_name
  retention_in_days = var.cloudwatch_log_group_retention
  kms_key_id        = var.kms_key_id
  tags = merge(
      {
        "name" = var.cloudwatch_log_group_name
      },
      var.standard_tags,
      )
  depends_on = [
    var.kms_key_id
  ]
}

######################################################################
# Define CloudWatch Log Alarm for Auto Scaling
######################################################################
resource "aws_cloudwatch_metric_alarm" "auto_scaling_alarm" {
  alarm_name          = var.cloudwatch_alarm_name
  comparison_operator = var.cloudwatch_alarm_comparison
  evaluation_periods  = var.cloudwatch_evaluation_periods
  metric_name         = var.cloudwatch_metric_name
  namespace           = var.cloudwatch_namespace
  period              = var.cloudwatch_alarm_period
  statistic           = var.cloudwatch_alarm_statistic
  threshold           = var.cloudwatch_alarm_threshold

  dimensions = {
    AutoScalingGroupName = var.auto_scaling_group_name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [var.auto_scaling_policy_arn]
}