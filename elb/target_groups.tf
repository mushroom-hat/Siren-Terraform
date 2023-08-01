
# target group for backend api
resource "aws_lb_target_group" "tg" {
  name     = "tg"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = module.vpc.mainVPC_id
}