variable "vpc_id" {
  type = string
}


variable "security_groups" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "load_balancer_name" {
  type = string
}

variable "load_balancer_type" {
  type = string
}


variable "listener_port" {
  type = string
}

variable "listener_protocol" {
  type = string
}

variable "listener_rule_action_type" {
  type = string
}

variable "heating_service_instance_id" {
  type = string
}


variable "light_service_instance_id" {
  type = string
}

variable "status_service_instance_id" {
  type = string
}

variable "auth_service_instance_id" {
  type = string
}

