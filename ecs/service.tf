# aws_ecs_service.SirenSVC:
resource "aws_ecs_service" "svc" {
    cluster                            = aws_ecs_cluster.cluster.id
    deployment_maximum_percent         = 200
    deployment_minimum_healthy_percent = 100
    desired_count                      = 1
    enable_ecs_managed_tags            = true
    enable_execute_command             = false
    health_check_grace_period_seconds  = 0
    name                               = var.svc_name
    platform_version                   = "LATEST"
    propagate_tags                     = "NONE"
    scheduling_strategy                = "REPLICA"
    task_definition                    = aws_ecs_task_definition.taskdef.id
    capacity_provider_strategy {
        base              = 0
        capacity_provider = "FARGATE"
        weight            = 1
    }

    deployment_circuit_breaker {
        enable   = true
        rollback = true
    }

    deployment_controller {
        type = "ECS"
    }

    load_balancer {
        container_name   = "siren"
        container_port   = 5000
        target_group_arn = var.tg_arn
    }

    network_configuration {
        assign_public_ip = true
        security_groups  = [
            var.default_security_group_id,
        ]
        subnets          = [
            var.subnet01_id,
            var.subnet02_id,
        ]
    }
}
