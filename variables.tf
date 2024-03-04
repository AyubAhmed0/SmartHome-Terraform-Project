
#####
### Networking
#####

variable "vpc_name" {
  type = string
}

variable "cidr_range" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

#####
### Security
#####

variable "security_group_name" {
  type = string
}