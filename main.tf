
resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}


# # scale up alarm
# resource "aws_autoscaling_policy" "example-cpu-policy" {
#   name                   = "example-cpu-policy"
#   autoscaling_group_name = aws_autoscaling_group.bar.name
#   adjustment_type        = "ChangeInCapacity"
#   scaling_adjustment     = "1"
#   cooldown               = "300"
#   policy_type            = "SimpleScaling"
# }
# resource "aws_cloudwatch_metric_alarm" "example-cpu-alarm" {
#   alarm_name          = "example-cpu-alarm"
#   alarm_description   = "example-cpu-alarm"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "120"
#   statistic           = "Average"
#   threshold           = "30"
#   dimensions = {
#     "AutoScalingGroupName" = "${aws_autoscaling_group.bar.name}"
#   }
#   actions_enabled = true
#   alarm_actions   = ["${aws_autoscaling_policy.example-cpu-policy.arn}"]
# }
# # scale down alarm
# resource "aws_autoscaling_policy" "example-cpu-policy-scaledown" {
#   name                   = "example-cpu-policy-scaledown"
#   autoscaling_group_name = aws_autoscaling_group.bar.name
#   adjustment_type        = "ChangeInCapacity"
#   scaling_adjustment     = "-1"
#   cooldown               = "300"
#   policy_type            = "SimpleScaling"
# }
# resource "aws_cloudwatch_metric_alarm" "example-cpu-alarm-scaledown" {
#   alarm_name          = "example-cpu-alarm-scaledown"
#   alarm_description   = "example-cpu-alarm-scaledown"
#   comparison_operator = "LessThanOrEqualToThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "120"
#   statistic           = "Average"
#   threshold           = "5"
#   dimensions = {
#     "AutoScalingGroupName" = "${aws_autoscaling_group.bar.name}"
#   }
#   actions_enabled = true
#   alarm_actions   = ["${aws_autoscaling_policy.example-cpu-policy-scaledown.arn}"]
# }