module "lambda_iam" {
  source = "../iam/lambda"

  lambda_name        = var.lambda_function_name
  cloudwatch_enabled = var.cloudwatch_enabled

  tags = var.tags
}

resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
  description   = var.lambda_description
  role          = module.lambda_iam.lambda_role_arn

  filename = local.lambda_zip_path
  runtime  = var.lambda_runtime
  handler  = var.lambda_handler

  timeout     = var.lambda_timeout
  memory_size = var.lambda_memory_size

  tags = var.tags

  environment {
    # ENV Vars cannot be empty
    variables = merge(var.environment_variables, { "STAGE" = var.stage })
  }

  lifecycle {
    ignore_changes = [layers]
    # Ignoring layer changes since these are deployed from the CI/CD scripts.
  }
}
