variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "The hash key (This is also referred to as a Partition Key on the AWS Console) of the table"
  type        = string
}

variable "hash_key_type" {
  description = "The data type of the hash key"
  type        = string
}
