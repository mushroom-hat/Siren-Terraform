# VPC
resource "aws_vpc" "vpc" {
  cidr_block       = "192.168.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
    Description = "Managed by Terraform"
  }
}


