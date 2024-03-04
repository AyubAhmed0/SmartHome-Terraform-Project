variable "subnet_id" {
  type        = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_security_group_ids" {
  type        = list(string)
}

variable "instance_name" {
  type = string
}

variable "is_public" {
  type = bool
}