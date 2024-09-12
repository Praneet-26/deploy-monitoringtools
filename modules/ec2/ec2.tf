resource "aws_security_group" "security_groups" {
  name        = "allow-all-tcp"
  description = "Security group that allows all TCP traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ansible_controlnode" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.public_subnet[0].id
    security_groups = [aws_security_group.security_groups.id]
    associate_public_ip_address = true

    tags = {
    Name = "ansible_controlnode"
  }
}

resource "aws_instance" "ansible_node" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.public_subnet[0].id
    security_groups = [aws_security_group.security_groups.id]
    associate_public_ip_address = true

    tags = {
    Name = "ansible_node"
  }
}