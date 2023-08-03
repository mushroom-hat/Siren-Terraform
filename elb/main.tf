# application lb
resource "aws_lb" "lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.default_security_group_id]
  subnet_mapping {
    subnet_id            = var.subnet01_id
  }

  subnet_mapping {
    subnet_id            = var.subnet02_id
  }

  tags = {
    Environment = "production"
  }
}

