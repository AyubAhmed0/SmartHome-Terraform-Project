resource "aws_ami_from_instance" "auth_public_ami" {
  name               = "AuthPublicAMI"
  source_instance_id = "i-0820a1279f3428fa0"

  tags = {
    Name = "auth_public_ami"
  }
}

# Heating service
resource "aws_ami_from_instance" "heating_service_ami" {
  name               = "HeatingServiceAMI"
  source_instance_id = "i-08d856e0095d14b05"

  tags = {
    Name = "heating_service_ami"
  }
}

# Light service
resource "aws_ami_from_instance" "light_service_ami" {
  name               = "LightingServiceAMI"
  source_instance_id = "i-005782ec435928db1"

  tags = {
    Name = "light_service_ami"
  }
}

# Status service
resource "aws_ami_from_instance" "status_service_ami" {
  name               = "StatusServiceAMI"
  source_instance_id = "i-053500751c86ccea9"

  tags = {
    Name = "status_service_ami"
  }
}

# Auth service
resource "aws_ami_from_instance" "auth_service_ami" {
  name               = "AuthServiceAMI"
  source_instance_id = "i-02a20442a07369e29"

  tags = {
    Name = "auth_service_ami"
  }
}