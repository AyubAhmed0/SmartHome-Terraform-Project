resource "aws_instance" "smart_home_server" {
  subnet_id = var.subnet_id
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = var.is_public

tags = {
    Name = var.instance_name
  }
}