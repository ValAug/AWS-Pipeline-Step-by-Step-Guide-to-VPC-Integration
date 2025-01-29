
resource "aws_sns_topic" "build_notifications" {
  name = "build-notifications-${random_string.unique_suffix.result}"
}


resource "aws_sns_topic_subscription" "email_subscription" {
  for_each = toset(var.notification_emails)
  topic_arn = aws_sns_topic.build_notifications.arn
  protocol  = "email"
  endpoint  = each.value
}