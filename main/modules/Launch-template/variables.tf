variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "heating_lt_ami" {
  type = string
}

variable "light_lt_ami" {
  type = string
}

variable "status_lt_ami" {
  type = string
}

variable "auth_lt_ami" {
  type = string
}