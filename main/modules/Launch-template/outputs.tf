output "heating_service_id" {
  value = aws_launch_template.heating_service_lt.id
}

output "light_service_id" {
  value = aws_launch_template.light_service_lt.id
}

output "status_service_id" {
  value = aws_launch_template.status_service_lt.id
}

output "auth_service_id" {
  value = aws_launch_template.auth_service_lt.id
}