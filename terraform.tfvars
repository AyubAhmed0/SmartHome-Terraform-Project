#####
### Networking
#####

vpc_name           = "smart_home_vpc"
cidr_range         = "10.0.0.0/16"
availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
public_subnets     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24"]