# AWS Region
variable "aws_region" {
  description = "Region Name"
  type        = string
  default     = "us-east-1"
}

data "aws_iam_policy_document" "ecs_agent" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}