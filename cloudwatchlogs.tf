# Update the pipeline to trigger SNS notifications
resource "aws_cloudwatch_metric_alarm" "build_failed" {
  alarm_name          = "BuildFailedAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name        = "FailedBuilds"
  namespace          = "AWS/CodeBuild"
  period             = "60"
  statistic          = "Sum"
  threshold          = "0"
  alarm_description  = "This alarm triggers when a build fails."
  alarm_actions      = [aws_sns_topic.build_notifications.arn]

  dimensions = {
    ProjectName = aws_codebuild_project.plan.name
  }
}

resource "aws_cloudwatch_metric_alarm" "build_succeeded" {
  alarm_name          = "BuildSucceededAlarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name        = "SucceededBuilds"
  namespace          = "AWS/CodeBuild"
  period             = "60"
  statistic          = "Sum"
  threshold          = "1"
  alarm_description  = "This alarm triggers when a build succeeds."
  alarm_actions      = [aws_sns_topic.build_notifications.arn]

  dimensions = {
    ProjectName = aws_codebuild_project.apply.name
  }
}

# Create CloudWatch log group for CodeBuild
resource "aws_cloudwatch_log_group" "codebuild_log_group" {
  name = "/aws/codebuild/${var.buildproject_plan_name}"
}

# Create a CloudWatch dashboard with a name
resource "aws_cloudwatch_dashboard" "build_dashboard" {
  dashboard_name = "BuildDashboard" # Name of the dashboard
  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x = 0,
        y = 0,
        width = 12,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/CodeBuild", "FailedBuilds", "ProjectName", aws_codebuild_project.plan.name ],
            [ "AWS/CodeBuild", "SucceededBuilds", "ProjectName", aws_codebuild_project.apply.name ]
          ],
          view = "timeSeries",
          stacked = false,
          region = "us-west-2",
          title = "Build Success and Failure Metrics"
        }
      }
    ]
  })
}