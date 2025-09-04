resource "aws_ecs_cluster" "main" {
    name = var.cluster_name

    setting {
        name  = "containerInsights"
        value = var.container_insights ? "enabled" : "disabled"
    } 
}

resource "aws_ecs_cluster_capacity_providers" "main" {
    cluster_name = aws_ecs_cluster.main.name
    
    capacity_providers = [
        "FARGATE",
        "FARGATE_SPOT"
        ]
        
    default_capacity_provider_strategy {
        capacity_provider = "FARGATE_SPOT"
        weight            = 1
    }

    depends_on = [aws_ecs_cluster.main, aws_ecs_capacity_provider.main]
}

resource "aws_ecs_task_definition" "main" {
    family                   = var.task_family
    network_mode             = var.network_mode 
    requires_compatibilities = var.requires_compatibilities
    cpu                      = var.task_cpu
    memory                   = var.task_memory
    execution_role_arn       = var.execution_role_arn
    task_role_arn            = var.task_role_arn

    container_definitions = jsonencode(
        var.container_definitions
        )
}

