resource "aws_vpc" "ansible_monitoring_tool_vpc" {
    cidr_block = var.vpc_cidr
    tags = var.vpc_tags
}

resource "aws_internet_gateway" "ansible_monitoring_tool_ig" {
  vpc_id = aws_vpc.ansible_monitoring_tool_vpc.id
  tags = var.IG_tags
}

resource "aws_subnet" "ansible_monitoring_tool_public_subnet" {
    vpc_id = aws_vpc.ansible_monitoring_tool_vpc.id
    cidr_block = var.public_subnet[0]
    availability_zone = var.az[0]
    tags = {
      Name = "Public subnet for EC2"
    }
}

resource "aws_route_table" "ansible_monitoring_tool_rt" {
    vpc_id = aws_vpc.ansible_monitoring_tool_vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ansible_monitoring_tool_ig.id
  }
    tags = {
        Name = "Route Table to get traffic to EC2"
    }
}

resource "aws_route_table_association" "rt-subnet-association" {
    subnet_id = aws_subnet.ansible_monitoring_tool_public_subnet.id
    route_table_id = aws_route_table.ansible_monitoring_tool_rt.id
}