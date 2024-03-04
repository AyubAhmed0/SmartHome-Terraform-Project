
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