data "http" "myipaddr" {
   url = "http://icanhazip.com"
}

#####
### Security Group
#####

resource "aws_security_group" "smart_home_security_grp" {
    name = "smart_home_security_grp"
    vpc_id = var.vpc_id

    tags = {
      Name = var.security_group_name
    }
}

#####
### Security Group Rules
#####

resource "aws_vpc_security_group_ingress_rule" "http_ipv6" {
  security_group_id = aws_security_group.smart_home_security_grp.id

  cidr_ipv6 = "::/0"
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "http_ipv4" {
  security_group_id = aws_security_group.smart_home_security_grp.id

  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_ipv6" {
  security_group_id = aws_security_group.smart_home_security_grp.id

  cidr_ipv6  = "::/0"
  from_port         = 443
  to_port           = 443
  ip_protocol          = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https_ipv4" {
  security_group_id = aws_security_group.smart_home_security_grp.id

  cidr_ipv4       = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol          = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.smart_home_security_grp.id


  cidr_ipv4 = "${chomp(data.http.myipaddr.response_body)}/32"
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "outgoing_ipv6" {
  security_group_id = aws_security_group.smart_home_security_grp.id


  cidr_ipv6 = "::/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_egress_rule" "outgoing_ipv4" {
  security_group_id = aws_security_group.smart_home_security_grp.id


  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}