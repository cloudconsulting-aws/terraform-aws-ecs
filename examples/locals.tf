locals {
  container_definitions = [
    {
      name      = "nginx-app"
      image     = "nginx:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 443
          hostPort      = 443
          protocol      = "tcp"
        }
      ]
    }
  ]
}
