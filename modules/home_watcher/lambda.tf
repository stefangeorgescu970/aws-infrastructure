module "lambda_proxy_function" {
  source = "../../stacks/lambda"

  stage                = var.stage
  lambda_function_name = "${local.app}-api-proxy-lambda-${var.stage}"
  lambda_runtime       = "python3.8"
  cloudwatch_enabled   = true

  tags = local.tags
}

data "aws_iam_policy_document" "allow_access_dynamodb_tables" {
  statement {
    actions = [
      "dynamodb:BatchGetItem",
      "dynamodb:GetItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:BatchWriteItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
    ]
    resources = [
      aws_dynamodb_table.network_data.arn,
      aws_dynamodb_table.logs.arn,
    ]
    effect = "Allow"
  }
}

resource "aws_iam_role_policy" "lambda_allow_dynamo" {
  name   = "${module.lambda_proxy_function.lambda_role_name}-dynamo-access-data"
  role   = module.lambda_proxy_function.lambda_role_id
  policy = data.aws_iam_policy_document.allow_access_dynamodb_tables.json
}

module "lambda_authorizer_function" {
  source = "../../stacks/lambda"

  stage                = var.stage
  lambda_function_name = "${local.app}-auth-lambda-${var.stage}"
  lambda_runtime       = "python3.8"
  lambda_code_path     = "${path.module}/resources/lambda.py"
  cloudwatch_enabled   = true

  tags = local.tags
}

data "aws_iam_policy_document" "allow_access_dynamodb_auth" {
  statement {
    actions = [
      "dynamodb:BatchGetItem",
      "dynamodb:GetItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:BatchWriteItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
    ]
    resources = [
      aws_dynamodb_table.auth.arn,
    ]
    effect = "Allow"
  }
}

resource "aws_iam_role_policy" "lambda_allow_dynamo_auth_authorizer" {
  name   = "${module.lambda_authorizer_function.lambda_role_name}-dynamo-access-auth"
  role   = module.lambda_authorizer_function.lambda_role_id
  policy = data.aws_iam_policy_document.allow_access_dynamodb_auth.json
}

resource "aws_iam_role_policy" "lambda_allow_dynamo_auth_api" {
  name   = "${module.lambda_proxy_function.lambda_role_name}-dynamo-access-auth"
  role   = module.lambda_proxy_function.lambda_role_id
  policy = data.aws_iam_policy_document.allow_access_dynamodb_auth.json
}
