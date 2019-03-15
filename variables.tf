variable "region" {
  description = "aws region"
  #default     = "eu-west-1"
}

variable "env" {
  description = "Environment name"
}

variable "name" {
  description = "Name codedeploy"
}

variable "ec2_filter_key" {
  description = "Name"
}

variable "ec2_filter_value" {
  description = "Name"
}

variable "trigger_sns_arn" {
  description = "SNS Lambda arn"
}