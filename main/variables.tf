
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

#####
### DynamoDB
#####

variable "hash_key" {
  description = "The hash key (This is also referred to as a Partition Key on the AWS Console) of the table"
  type        = string
}

variable "hash_key_type" {
  description = "The data type of the hash key"
  type        = string
}

variable "table_names" {
  type = list(string)
}

#####
### Servers
#####

variable "ami" {
  type = string
}

variable "auth_public_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

#####
### Load Balancer
#####
variable "load_balancer_name" {
  type = string
}

variable "load_balancer_type" {
  type = string
}

variable "listener_port" {
  type = number
}

variable "listener_protocol" {
  type = string
}

variable "listener_rule_action_type" {
  type = string
}