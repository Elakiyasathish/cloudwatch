# Create an IAM role for CloudWatch Agent
resource "aws_iam_role" "cloudwatch_agent_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach the CloudWatch Agent policy to the IAM role
resource "aws_iam_policy_attachment" "attach_cloudwatch_agent_policy" {
  name       = "attach-cloudwatch-agent-policy"
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  roles      = [aws_iam_role.cloudwatch_agent_role.name]
}

resource "aws_iam_instance_profile" "cloudwatch_agent_instance_profile" {
  name = var.iam_instance_profile_name
  role = aws_iam_role.cloudwatch_agent_role.name
}
