# Output variables
output "mainVPC_id" {
  value = aws_vpc.mainVPC.id
}

output "subnet01_id" {
  value = aws_subnet.subnet01.id
}

output "subnet02_id" {
  value = aws_subnet.subnet02.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "default_security_group_id" {
  value = aws_default_security_group.sg.id
}
