variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "main-ecs-cluster"
}

variable "container_insights" {
  description = "Enable Container Insights for ECS cluster"
  type        = bool
  default     = false
}

variable "task_family" {
  description = "Family name for the ECS task definition"
  type        = string
  default     = "main-task-family"
}

variable "task_cpu" {
  description = "CPU units for the ECS task"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Memory (in MiB) for the ECS task"
  type        = string
  default     = "512"
}

variable "execution_role_arn" {
  description = "ARN of the execution role for the ECS task"
  type        = string
  default     = ""
}

variable "task_role_arn" {
  description = "ARN of the task role for the ECS task"
  type        = string
  default     = ""
}

variable "container_definitions" {
  description = "Container definitions for the ECS task"
  type        = any
  default = [
    {
      name      = "first"
      image     = ""
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 443
          hostPort      = 443
        }
      ]
    }
  ]
}

variable "network_mode" {
  description = "Network mode for the ECS task"
  type        = string
  default     = "awsvpc"

}

variable "requires_compatibilities" {
  description = "List of launch types required by the task"
  type        = list(string)
  default     = ["FARGATE"]

}
