resource "aws_cloudwatch_metric_alarm" "example" {
  count              = length(var.instance_ids)
  alarm_name         = var.alarm_names[count.index]
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 2
  metric_name        = "mem_used_percent"
  namespace          = "CWAgent"
  period             = var.period
  statistic          = "Average"
  threshold          = var.threshold
  alarm_description  = <<-EOT
    CPU utilization is greater than ${var.threshold}% for 10 minutes
  EOT

  dimensions = {
    InstanceId = var.instance_ids[count.index]
  }
}
