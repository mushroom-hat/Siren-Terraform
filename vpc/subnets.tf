# Subnets
resource "aws_subnet" "subnet01" {
  vpc_id     = aws_vpc.mainVPC.id
  cidr_block = "192.168.0.0/25"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "Main"
  }
}
resource "aws_subnet" "subnet02" {
  vpc_id     = aws_vpc.mainVPC.id
  cidr_block = "192.168.0.128/25"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "Secondary"
  }
}
