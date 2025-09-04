# terraform-aws-ecs
Terraform module for deploying and managing AWS ECS clusters, services, and task definitions with scalable and secure configurations.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the ECS cluster | `string` | `"main-ecs-cluster"` | no |
| <a name="input_container_definitions"></a> [container\_definitions](#input\_container\_definitions) | Container definitions for the ECS task | `any` | <pre>[<br/>  {<br/>    "cpu": 10,<br/>    "essential": true,<br/>    "image": "",<br/>    "memory": 512,<br/>    "name": "first",<br/>    "portMappings": [<br/>      {<br/>        "containerPort": 443,<br/>        "hostPort": 443<br/>      }<br/>    ]<br/>  }<br/>]</pre> | no |
| <a name="input_container_insights"></a> [container\_insights](#input\_container\_insights) | Enable Container Insights for ECS cluster | `bool` | `false` | no |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | ARN of the execution role for the ECS task | `string` | `""` | no |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | Network mode for the ECS task | `string` | `"awsvpc"` | no |
| <a name="input_requires_compatibilities"></a> [requires\_compatibilities](#input\_requires\_compatibilities) | List of launch types required by the task | `list(string)` | <pre>[<br/>  "FARGATE"<br/>]</pre> | no |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | CPU units for the ECS task | `string` | `"256"` | no |
| <a name="input_task_family"></a> [task\_family](#input\_task\_family) | Family name for the ECS task definition | `string` | `"main-task-family"` | no |
| <a name="input_task_memory"></a> [task\_memory](#input\_task\_memory) | Memory (in MiB) for the ECS task | `string` | `"512"` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | ARN of the task role for the ECS task | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_cluster_arn"></a> [ecs\_cluster\_arn](#output\_ecs\_cluster\_arn) | The ARN of the ECS cluster. |
| <a name="output_ecs_cluster_capacity_providers"></a> [ecs\_cluster\_capacity\_providers](#output\_ecs\_cluster\_capacity\_providers) | The capacity providers associated with the ECS cluster. |
| <a name="output_ecs_cluster_id"></a> [ecs\_cluster\_id](#output\_ecs\_cluster\_id) | The ID of the ECS cluster. |
| <a name="output_ecs_cluster_name"></a> [ecs\_cluster\_name](#output\_ecs\_cluster\_name) | The name of the ECS cluster. |
| <a name="output_ecs_task_definition_arn"></a> [ecs\_task\_definition\_arn](#output\_ecs\_task\_definition\_arn) | The ARN of the ECS task definition. |
| <a name="output_ecs_task_definition_family"></a> [ecs\_task\_definition\_family](#output\_ecs\_task\_definition\_family) | The family of the ECS task definition. |
| <a name="output_ecs_task_definition_revision"></a> [ecs\_task\_definition\_revision](#output\_ecs\_task\_definition\_revision) | The revision of the ECS task definition. |
<!-- END_TF_DOCS -->

## Usage

```hcl
module "ecs" {
    source  = "cloudconsulting/ecs/aws"
    version = "x.y.z"

    cluster_name           = "example-ecs-cluster"
    container_definitions  = var.container_definitions
    execution_role_arn     = aws_iam_role.ecs_execution_role.arn
    task_role_arn          = aws_iam_role.ecs_task_role.arn
    network_mode           = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    task_cpu               = "256"
    task_memory            = "512"
    container_insights     = true
}
```

## Example

See [`examples/`](./examples/) for complete usage.

## License

This project is licensed under the [MIT License](LICENSE).
