output "auth_public_ami" {
  value = aws_ami_from_instance.auth_public_ami.id
}
