######
## Load Balancer
######

# Public-facing load balancer
resource "aws_lb" "smart_home_public_lb" {
  name               = "${var.load_balancer_name}-public"
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups
  subnets            = var.public_subnets
}

# Internal load balancer
resource "aws_lb" "smart_home_internal_lb" {
  name               = "${var.load_balancer_name}-internal"
  internal           = true
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups
  subnets            = var.private_subnets
}

# Listener for the public load balancer
resource "aws_lb_listener" "public_listener" {
  load_balancer_arn = aws_lb.smart_home_public_lb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: Not Found"
      status_code  = "404"
    }
  }
}

# Listener for the internal load balancer 
resource "aws_lb_listener" "internal_listener" {
  load_balancer_arn = aws_lb.smart_home_internal_lb.arn
  port              = var.listener_port 
  protocol          = var.listener_protocol  

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: Not Found"
      status_code  = "404"
    }
  }
}

######
## Heating service
######

# target group for the heating service
resource "aws_lb_target_group" "heating_service" {
  name     = "heating-service-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled  = true
    path     = "/health"
    protocol = "HTTP"
  }
}

# group attachment for the heating service
resource "aws_lb_target_group_attachment" "smart_home_gr_attachment" {
  target_group_arn = aws_lb_target_group.heating_service.arn
  target_id        = var.heating_service_instance_id
  port             = 3000
}

# Listener rule for the heating service
resource "aws_lb_listener_rule" "heating_service_rule" {
  listener_arn = aws_lb_listener.public_listener.arn
  priority     = 100

  action {
    type             = var.listener_rule_action_type
    target_group_arn = aws_lb_target_group.heating_service.arn
  }

  condition {
    path_pattern {
      values = ["/api/heating/*"]
    }
  }
}

######
## Light service
######

# Target group for the light service
resource "aws_lb_target_group" "light_service" {
  name     = "light-service-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled  = true
    path     = "/api/lights/health"
    protocol = "HTTP"
  }
}
# group attachment for the light service
resource "aws_lb_target_group_attachment" "light_service_attachment" {
  target_group_arn = aws_lb_target_group.light_service.arn
  target_id        = var.light_service_instance_id
  port             = 3000
}

# Listener rule for the light service
resource "aws_lb_listener_rule" "light_service_rule" {
  listener_arn = aws_lb_listener.public_listener.arn
  priority     = 110

  action {
    type             = var.listener_rule_action_type
    target_group_arn = aws_lb_target_group.light_service.arn
  }

  condition {
    path_pattern {
      values = ["/api/lights/*"]
    }
  }
}

######
## Status service
######

# Target group for the status service
resource "aws_lb_target_group" "status_service" {
  name     = "status-service-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled  = true
    path     = "/api/status/health"
    protocol = "HTTP"
  }
}

# Group attachment for the status service
resource "aws_lb_target_group_attachment" "status_service_attachment" {
  target_group_arn = aws_lb_target_group.status_service.arn
  target_id        = var.status_service_instance_id
  port             = 3000
}

# Listener rule for the status service
resource "aws_lb_listener_rule" "status_service_rule" {
  listener_arn = aws_lb_listener.public_listener.arn
  priority     = 120

  action {
    type             = var.listener_rule_action_type
    target_group_arn = aws_lb_target_group.status_service.arn
  }

  condition {
    path_pattern {
      values = ["/api/status/*"]
    }
  }
}

######
## Auth service
######

# Target group for the auth service
resource "aws_lb_target_group" "auth_service" {
  name     = "auth-service-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled  = true
    path     = "/api/auth"
    protocol = "HTTP"
  }
}

# Group attachment for the auth service
resource "aws_lb_target_group_attachment" "auth_service_attachment" {
  target_group_arn = aws_lb_target_group.auth_service.arn
  target_id        = var.auth_service_instance_id
  port             = 3000
}

# Listener rule for the auth service
resource "aws_lb_listener_rule" "auth_service_rule" {
  listener_arn = aws_lb_listener.internal_listener.arn
  priority     = 130

  action {
    type             = var.listener_rule_action_type
    target_group_arn = aws_lb_target_group.auth_service.arn
  }

  condition {
    path_pattern {
      values = ["/api/auth/*"]
    }
  }
}
