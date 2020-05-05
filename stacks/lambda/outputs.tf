output "lambda_name" {
  value = var.lambda_function_name
}

output "lambda_arn" {
  value = aws_lambda_function.lambda.arn
}

output "lambda_role_name" {
  value = module.lambda_iam.lambda_role_name
}

output "lambda_role_arn" {
  value = module.lambda_iam.lambda_role_arn
}

output "lambda_role_id" {
  value = module.lambda_iam.lambda_role_id
}
