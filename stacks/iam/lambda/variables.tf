variable "lambda_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "cloudwatch_enabled" {
  description = "Whether to add cloudwatch logs permissions."
  type        = bool
}

variable "tags" {
  description = "A map of tags to be added to the IAM Role."
  default     = {}
  type        = map(string)
}
