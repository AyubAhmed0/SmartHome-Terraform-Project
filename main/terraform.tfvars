#####
### Networking
#####

vpc_name           = "smart_home_vpc"
cidr_range         = "10.0.0.0/16"
availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
public_subnets     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24"]

#####
### Security
#####

security_group_name = "smart_home_security_group"

#####
### DynamoDB 
#####

table_names   = ["Lighting", "Heating"]
hash_key      = "id"
hash_key_type = "N"

#####
### Servers
#####

ami             = "ami-0505148b3591e4c07"
auth_public_ami = "ami-06010b504f5d7eae6"
instance_type   = "t2.micro"
key_name        = "smart-home-key"

#####
### Load Balancer
#####

load_balancer_name        = "smart-home-lb"
load_balancer_type        = "application"
listener_port             = 80
listener_protocol         = "HTTP"
listener_rule_action_type = "forward"

#####
### Launch Template
#####

heating_lt_ami = "ami-0446dcb1b143502fa"
light_lt_ami   = "ami-0a5d4e17081422de3"
status_lt_ami  = "ami-0de7871263485e01d"
auth_lt_ami    = "ami-0cc0fc940d4e47690"

#####
### Auto Scaling
#####

min_size         = 1
desired_capacity = 2
max_size         = 3

