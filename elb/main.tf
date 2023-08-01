module "vpc" {
  source = "../vpc"
}

# application lb
resource "aws_lb" "lb" {
  name               = "lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.vpc.default_security_group_id]
  subnet_mapping {
    subnet_id            = module.vpc.subnet01_id
  }

  subnet_mapping {
    subnet_id            = module.vpc.subnet02_id
  }

  tags = {
    Environment = "production"
  }
}

