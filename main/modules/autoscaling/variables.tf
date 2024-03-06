variable "min_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}

variable "max_size" {
  type = number
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "heating_tg_arn" {
  type = string
}

variable "light_tg_arn" {
  type = string
}

variable "status_tg_arn" {
  type = string
}

variable "auth_tg_arn" {
  type = string
}

variable "heating_lt_id" {
  type = string
}

variable "light_lt_id" {
  type = string
}

variable "status_lt_id" {
  type = string
}

variable "auth_lt_id" {
  type = string
}
