# Configuration Variables

variable "lambda_function_name" {
  description = "Lambda name."
  type        = string
}

variable "env" {
  description = "Environment for deploy."
  type        = string
}

variable "lambda_runtime" {
  description = "Lambda runtime."
  type        = string
  default     = "nodejs12.x"
}

variable "lambda_description" {
  description = "Lambda description."
  type        = string
  default     = ""
}

variable "lambda_handler" {
  description = "Lambda handler path. In the form of <file_name>.<method_name>."
  type        = string
  default     = "index.handler"
}

variable "lambda_timeout" {
  description = "Maximum runtime for Lambda in seconds."
  type        = number
  default     = 1000
}

variable "lambda_memory_size" {
  description = "Lambda allocated memory size in MB."
  type        = number
  default     = 128
}

variable "environment_variables" {
  description = "Environment variables to pass to the Lambda runtime."
  type        = map(any)
  default     = {}
}

variable "cloudwatch_enabled" {
  description = "Whether to enable Cloudwatch Logs."
  type        = bool
  default     = false
}

variable "lambda_code_path" {
  description = "Path to the file containing the lambda code."
  type        = string
  default     = ""
}

variable "allowed_bucket_resources" {
  description = "Arns of allowed buckets."
  type        = list(string)
  default     = []
}

variable "scheduling_enabled" {
  description = "Whether to create resources related to scheduling this lambda."
  type        = bool
  default     = false
}

variable "schedule_expression" {
  description = "The expression to use when creating the cloudwatch event rule. EG. rate(5 minutes)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to be added to the Lambda Function."
  type        = map(string)
  default     = {}
}

# Local Variables

locals {
  default_lambda_code_path = "resources/default_index.js"
}
