resource "aws_ami_from_instance" "auth_public_ami" {
  name               = "AuthPublicAMI"
  source_instance_id = "i-0caf97c589aa43b05"

  tags = {
    Name = "auth_public_ami"
  }
}
