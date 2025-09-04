output "ecs_cluster_id" {
    description = "The ID of the ECS cluster."
    value       = aws_ecs_cluster.main.id
}

output "ecs_cluster_arn" {
    description = "The ARN of the ECS cluster."
    value       = aws_ecs_cluster.main.arn
}

output "ecs_cluster_name" {
    description = "The name of the ECS cluster."
    value       = aws_ecs_cluster.main.name
}

output "ecs_cluster_capacity_providers" {
    description = "The capacity providers associated with the ECS cluster."
    value       = aws_ecs_cluster_capacity_providers.main.capacity_providers
}

output "ecs_task_definition_arn" {
    description = "The ARN of the ECS task definition."
    value       = aws_ecs_task_definition.main.arn
}

output "ecs_task_definition_family" {
    description = "The family of the ECS task definition."
    value       = aws_ecs_task_definition.main.family
}

output "ecs_task_definition_revision" {
    description = "The revision of the ECS task definition."
    value       = aws_ecs_task_definition.main.revision
}