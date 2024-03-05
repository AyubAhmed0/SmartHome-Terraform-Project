output "load_balancer_dns_name" {
  value = aws_lb.smart_home_public_lb.dns_name
}