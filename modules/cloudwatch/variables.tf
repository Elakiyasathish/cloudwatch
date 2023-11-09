variable "threshold" {
  description = "The threshold value to trigger the alarm"
  default     = 80
}

variable "period" {
  description = "The  value to trigger the alarm"
  default     = 300
}
variable "instance_ids" {
  description = "List of EC2 instance IDs to monitor"
  type        = list(string)
}

variable "alarm_names" {
  description = "List of names for the CloudWatch Alarms"
  type        = list(string)
}
