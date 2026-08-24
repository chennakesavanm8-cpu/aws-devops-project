resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "terraform-web-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when EC2 CPU exceeds 70%"
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.web.id
  }
  alarm_actions = [aws_sns_topic.alerts.arn] 
}