resource "aws_iam_role" "ecs_sheriff" {
  name               = "sheriff"
  assume_role_policy = <<EOF
    {
        "Version":"2012-10-17",
        "Statement": [
            {
                "Action":"sts:AssumeRole"
                "Principal":{
                    "Service":"ec2.amazonaws.com"
                },
                "Effect":"Allow",
                "Sid":""
            }
        ]
    }
    EOF
}

resource "aws_iam_policy" "ecs_law" {
  name        = "esc_law"
  description = "ECS Limited ecsInstanceRole"
  policy      = <<Policy
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "ec2:DescribeTags",
                    "ecs:CreateCluster",
                    "ecs:DeregisterContainerInstance",
                    "ecs:DiscoverPollEndpoint",
                    "ecs:Poll",
                    "ecs:RegisterContainerInstance",
                    "ecs:StartTelemetrySession",
                    "ecs:UpdateContainerInstancesState",
                    "ecs:Submit*",
                    "ecr:GetAuthorizationToken",
                    "ecr:BatchCheckLayerAvailability",
                    "ecr:GetDownloadUrlForLayer",
                    "ecr:BatchGetImage",
                    "logs:CreateLogStream",
                    "logs:PutLogEvents"
                ],
                "Resource": "*"
            }
        ]
    }
    Policy
}

resource "aws_iam_policy_attachement" "esc_judge" {
  name       = "esc_judge"
  roles      = [aws_iam_role.ecs_sheriff.name]
  policy_arn = aws_iam_policy.ecs_law.arn
}

