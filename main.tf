#####
### Networking
#####

module "networking" {
  source = "./modules/networking"

  vpc_name           = var.vpc_name
  cidr_range         = var.cidr_range
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}

#####
### Security 
#####

module "security" {
  source = "./modules/security"

  vpc_id              = module.networking.vpc_id
  security_group_name = var.security_group_name
}

#####
### DynamoDB
#####

locals {
  table_names = ["Lighting", "Heating"]
}
module "dynamodb_tables" {
  source = "./modules/dynamodb"

  count         = length(local.table_names)
  table_name    = local.table_names[count.index]
  hash_key      = var.hash_key
  hash_key_type = var.hash_key_type
}


