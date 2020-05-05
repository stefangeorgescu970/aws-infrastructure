# Configuration Variables

variable "stage" {
  description = "Deployment environment."
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda name."
  type        = string
}

variable "lambda_runtime" {
  description = "Lambda runtime."
  type        = string
}

variable "lambda_description" {
  description = "Lambda description."
  type        = string
  default     = ""
}

variable "lambda_handler" {
  description = "Lambda handler path. In the form of <file_name>.<method_name>."
  type        = string
  default     = "lambda.handler"
}

variable "lambda_timeout" {
  description = "Maximum runtime for Lambda in miliseconds."
  type        = number
  default     = 600
}

variable "lambda_memory_size" {
  description = "Lambda allocated memory size in MB."
  type        = number
  default     = 128
}

variable "environment_variables" {
  description = "Environment variables to pass to the Lambda runtime."
  type        = map
  default     = {}
}

variable "cloudwatch_enabled" {
  description = "Whether to enable Cloudwatch Logs."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to be added to the Lambda Function."
  type        = map(string)
  default     = {}
}

# Local Variables

locals {
  lambda_zip_path = "resources/lambda_default_code.zip"
}
