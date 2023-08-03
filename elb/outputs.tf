# Output variables
output "lb_id" {
  value = aws_lb.lb.id
}

output "tg_arn" {
  value = aws_lb_target_group.tg.arn
}

