resource "aws_ecs_cluster" "cluster" {
  name = "SirenClusterTF"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}