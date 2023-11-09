variable "instance_name" {
  description = "Name to be used on EC2 Instance"
  type        = string
}

variable "ad_instance_name" {
  description = "Name to be used on EC2 Instance"
  type        = string
}

variable "ami" {
  description = "AMI ID used for Instance"
  type        = string
  default     = "ami-005f8adf84f8c5057"
  #Replace the ami id for your requirement
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
  #Replace the instance_type for your requirement
}

variable "subnet_id" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]
}

variable "env" {
  description = "Name of the environment"
  type        = string
}
variable "ad_env" {
  description = "Name of the environment"
  type        = string
}
variable "instance_count" {
  default = "1"
}

variable "vpc" {
  description = "The name of the vpc the resources should live in"
  type        = string
  default     = "vpc-0a0f6e97e12eb206c"
}

variable "associate_public_ip_address" {
  description = "Associate public address for the Instance"
  type        = bool
  default     = true
}

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
variable "ad_vpc" {
  description = "The name of the vpc the resources should live in"
  type        = string
  default     = "vpc-0a0f6e97e12eb206c"
}
variable "threshold" {
  description = "The threshold value to trigger the alarm"
  default     = 80
}

variable "period" {
  description = "The  value to trigger the alarm"
  default     = 300
}
