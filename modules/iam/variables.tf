variable "iam_role_name" {
  description = "The name of the IAM role for the CloudWatch Agent."
  type        = string
  default     = "cloudwatch_agent_role"
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM instance profile for the CloudWatch Agent."
  type        = string
  default     = "cloudwatch_agent_instance_profile"
}


