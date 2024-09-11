output "public_subnets" {
  description = "For EC2 instance"
  value =[aws_subnet.ansible_monitoring_tool_public_subnet]
}

output "vpc_id" {
  value = aws_vpc.ansible_monitoring_tool_vpc.id
}