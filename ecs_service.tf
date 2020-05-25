resource "aws_ecs_sevice" "webapp" {
  name            = "webapp"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 2
  iam_role        = aws_iam_role.ecs_sheriff.arn
  depends_on      = ["aws_iam_policy.ecs_law"]

  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name = "webappcv"
    container_port = 80
  }
}

/* Create Load Balancer */