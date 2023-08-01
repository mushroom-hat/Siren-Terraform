# VPC
resource "aws_vpc" "mainVPC" {
  cidr_block       = "192.168.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}


