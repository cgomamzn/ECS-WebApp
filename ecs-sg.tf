resource "aws_security_group" "allow_global_connection" {
  name        = "ecs_global_connection"
  vpc_id      = aws_vpc.vpc.id
  description = "Allow Traffic to ECS"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["72.21.198.64/32"]
  }

  ingress {
    description = "HTTP Traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["72.21.198.64/32"]
  }

  ingress {
    description = "HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["72.21.198.64/32"]
  }

  egress {
    description = "ECS Outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment_tag
  }
}
