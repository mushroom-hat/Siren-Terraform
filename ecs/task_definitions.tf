resource "aws_ecs_task_definition" "taskdef" {
    container_definitions    = jsonencode(
        [
            {
                cpu              = 0
                environment      = [
                    {
                        name  = "NODE_ENV"
                        value = "production"
                    },
                ]
                environmentFiles = []
                essential        = true
                healthCheck      = {
                    command  = [
                        "CMD-SHELL",
                        "echo \"test\" || exit 1",
                    ]
                    interval = 30
                    retries  = 3
                    timeout  = 5
                },
                logConfiguration = {
                   logDriver = "awslogs",
                   options   = {
                        awslogs-group         = "/ecs/",
                        awslogs-region        =  "ap-southeast-1",
                        awslogs-stream-prefix = "ecs"
			}
                },
                image            = "169454521281.dkr.ecr.ap-southeast-1.amazonaws.com/siren_images:latest"
                mountPoints      = []
                name             = "siren"
                portMappings     = [
                    {
                        appProtocol   = "http"
                        containerPort = 5000
                        hostPort      = 5000
                        name          = "test-5000-tcp"
                        protocol      = "tcp"
                    },
                ]
                ulimits          = []
                volumesFrom      = []
            },
        ]
    )
    cpu                      = "1024"
    execution_role_arn       = "arn:aws:iam::169454521281:role/ecsTaskExecutionRole"
    family                   = var.taskDefFamily_name
    memory                   = "2048"
    network_mode             = "awsvpc"
    requires_compatibilities = [
        "FARGATE",
    ]
    task_role_arn            = "arn:aws:iam::169454521281:role/ecsTaskExecutionRole"

    runtime_platform {
        cpu_architecture        = "X86_64"
        operating_system_family = "LINUX"
    }
}
