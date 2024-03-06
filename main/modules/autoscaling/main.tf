# Heating
resource "aws_autoscaling_group" "heating_asg" {
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity
  launch_template {
    id      = var.heating_lt_id
    version = "$Latest"
  }

   vpc_zone_identifier = var.public_subnets
   target_group_arns   = [var.heating_tg_arn]

  tag {
    key                 = "Name"
    value               = "heating-ASG-Instance"
    propagate_at_launch = true
  }
}

# Light

resource "aws_autoscaling_group" "light_asg" {
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity
  launch_template {
    id      = var.light_lt_id
    version = "$Latest"
  }

   vpc_zone_identifier = var.public_subnets
   target_group_arns   = [var.light_tg_arn]

  tag {
    key                 = "Name"
    value               = "light-ASG-Instance"
    propagate_at_launch = true
  }
}

# Status

resource "aws_autoscaling_group" "status_asg" {
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity
  launch_template {
    id      = var.status_lt_id
    version = "$Latest"
  }

   vpc_zone_identifier = var.public_subnets
   target_group_arns   = [var.status_tg_arn]

  tag {
    key                 = "Name"
    value               = "status-ASG-Instance"
    propagate_at_launch = true
  }
}

# Auth

resource "aws_autoscaling_group" "auth_asg" {
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity
  launch_template {
    id      = var.auth_lt_id
    version = "$Latest"
  }

   vpc_zone_identifier = var.private_subnets
   target_group_arns   = [var.auth_tg_arn]

  tag {
    key                 = "Name"
    value               = "auth-ASG-Instance"
    propagate_at_launch = true
  }
}