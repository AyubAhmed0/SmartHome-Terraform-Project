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

module "dynamodb_tables" {
  source = "./modules/dynamodb"

  count         = length(var.table_names)
  table_name    = var.table_names[count.index]
  hash_key      = var.hash_key
  hash_key_type = var.hash_key_type
}

#####
### Servers
#####

module "heating_service" {
  source                 = "./modules/server"
  ami                    = var.ami
  subnet_id              = module.networking.public_subnets[0]
  vpc_security_group_ids = [module.security.security_group_id]
  instance_type          = var.instance_type
  key_name               = var.key_name
  is_public              = true
  instance_name          = "heating_service"
}

module "light_service" {
  source                 = "./modules/server"
  ami                    = var.ami
  subnet_id              = module.networking.public_subnets[1]
  vpc_security_group_ids = [module.security.security_group_id]
  instance_type          = var.instance_type
  key_name               = var.key_name
  is_public              = true
  instance_name          = "light_service"
}

module "status_service" {
  source                 = "./modules/server"
  ami                    = var.ami
  subnet_id              = module.networking.public_subnets[2]
  vpc_security_group_ids = [module.security.security_group_id]
  instance_type          = var.instance_type
  key_name               = var.key_name
  is_public              = true
  instance_name          = "status_service"
}

module "auth_service" {
  source                 = "./modules/server"
  ami                    = var.ami
  subnet_id              = module.networking.private_subnets[2]
  vpc_security_group_ids = [module.security.security_group_id]
  instance_type          = var.instance_type
  key_name               = var.key_name
  is_public              = false
  instance_name          = "auth_service"
}

