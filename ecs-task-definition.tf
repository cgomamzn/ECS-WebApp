resource "aws_ecs_task_definition" "app" {
    family = "service"
    container_definitions = file("task-definitions/service.json")
}
