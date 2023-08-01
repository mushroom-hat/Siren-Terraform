
# target group for backend api
resource "aws_lb_target_group" "tg" {
  name     = "tg"
  port     = 5000
  protocol = "HTTP"
  target_type = "ip"
  vpc_id      = var.mainVPC_id


  health_check {
      path                = "/containerHealthCheck"
      port                = 80
      protocol            = "HTTP"
      healthy_threshold   = 5
      unhealthy_threshold = 3
  
    }

}