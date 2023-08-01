resource "aws_default_security_group" "sg" {
  vpc_id = aws_vpc.mainVPC.id

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mainVPC.cidr_block]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mainVPC.cidr_block]
  }

  ingress {
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mainVPC.cidr_block]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    self      	     = true
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

}