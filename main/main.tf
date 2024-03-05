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

module "auth_service_public" {
  source                 = "./modules/server"
  ami                    = var.ami
  subnet_id              = module.networking.public_subnets[2]
  vpc_security_group_ids = [module.security.security_group_id]
  instance_type          = var.instance_type
  key_name               = var.key_name
  is_public              = true
  instance_name          = "auth_service_public_setup"
}

module "auth_service" {
  source                 = "./modules/server"
  ami                    = var.auth_public_ami
  subnet_id              = module.networking.private_subnets[2]
  vpc_security_group_ids = [module.security.security_group_id]
  instance_type          = var.instance_type
  key_name               = var.key_name
  is_public              = false
  instance_name          = "auth_service"
}

#####
### Load Balancer
#####

module "smart_home_load_balancer" {
  source = "./modules/loadbalancer"

  load_balancer_name          = var.load_balancer_name
  load_balancer_type          = var.load_balancer_type
  listener_port               = var.listener_port
  listener_protocol           = var.listener_protocol
  listener_rule_action_type   = var.listener_rule_action_type
  public_subnets              = module.networking.public_subnets
  private_subnets             = module.networking.private_subnets
  security_groups             = [module.security.security_group_id]
  vpc_id                      = module.networking.vpc_id
  heating_service_instance_id = module.heating_service.instance_id
  light_service_instance_id   = module.light_service.instance_id
  status_service_instance_id  = module.status_service.instance_id
  auth_service_instance_id    = module.auth_service.instance_id
}
