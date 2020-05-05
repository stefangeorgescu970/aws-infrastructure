module "lambda_function" {
  source = "../../stacks/lambda"

  stage                = var.stage
  lambda_function_name = "${local.app}-lambda-${var.stage}"
  lambda_runtime       = "python3.8"

  tags = local.tags
}
