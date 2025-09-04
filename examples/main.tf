module "ecs" {
  source                   = "../"
  cluster_name             = "example-ecs-cluster"
  execution_role_arn       = "arn:aws:iam::123456789012:role/random-ecs-execution-role"
  task_role_arn            = "arn:aws:iam::123456789012:role/random-ecs-task-role"
  container_definitions    = local.container_definitions
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_cpu                 = "256"
  task_memory              = "512"
  container_insights       = true
}
