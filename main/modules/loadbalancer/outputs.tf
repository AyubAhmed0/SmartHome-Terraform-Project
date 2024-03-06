output "load_balancer_dns_name" {
  value = aws_lb.smart_home_public_lb.dns_name
}

output "heating_service_arn" {
  value = aws_lb_target_group.heating_service.arn
}

output "light_service_arn" {
  value = aws_lb_target_group.light_service.arn
}

output "status_service_arn" {
  value = aws_lb_target_group.status_service.arn
}

output "auth_service_arn" {
  value = aws_lb_target_group.auth_service.arn
}