data "archive_file" "lambda_code_zip" {
  type        = "zip"
  output_path = "/tmp/${var.lambda_function_name}.zip"

  source {
    content  = file(length(var.lambda_code_path) > 0 ? var.lambda_code_path : "${path.module}/${local.default_lambda_code_path}")
    filename = "index.js"
  }
}


resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
  description   = var.lambda_description
  role          = aws_iam_role.lambda_role.arn

  filename = data.archive_file.lambda_code_zip.output_path
  runtime  = var.lambda_runtime
  handler  = var.lambda_handler

  timeout     = var.lambda_timeout
  memory_size = var.lambda_memory_size

  tags = var.tags

  environment {
    # ENV Vars cannot be empty
    variables = merge(var.environment_variables, { "NODE_ENV" = var.env })
  }
}
