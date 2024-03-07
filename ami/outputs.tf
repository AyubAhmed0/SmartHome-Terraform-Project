# output "auth_public_ami" {
#   value = aws_ami_from_instance.auth_public_ami.id
# }
output "heating_service_ami" {
  value = aws_ami_from_instance.heating_service_ami.id
}

output "light_service_ami" {
  value = aws_ami_from_instance.light_service_ami.id
}

output "status_service_ami" {
  value = aws_ami_from_instance.status_service_ami.id
}

output "auth_service_ami" {
  value = aws_ami_from_instance.auth_service_ami.id
}