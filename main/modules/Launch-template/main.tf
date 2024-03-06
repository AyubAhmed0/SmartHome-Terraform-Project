

// Heating Lauch Template
resource "aws_launch_template" "heating_service_lt" {
  name          = "HeatingServiceLT"
  image_id      = var.heating_lt_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_groups
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "HeatingServiceInstance"
    }
  }
}

// Lights Lauch Template
resource "aws_launch_template" "light_service_lt" {
  name          = "LightServiceLT"
  image_id      = var.light_lt_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_groups
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "LightServiceInstance"
    }
  }
}

// status Lauch Template
resource "aws_launch_template" "status_service_lt" {
  name          = "StatusServiceLT"
  image_id      = var.status_lt_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_groups
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "StatusServiceInstance"
    }
  }
}

// Auth Lauch Template
resource "aws_launch_template" "auth_service_lt" {
  name                   = "AuthServiceLT"
  image_id               = var.auth_lt_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "AuthServiceInstance"
    }
  }
}
