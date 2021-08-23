module "backups_bucket" {
  source      = "../../stacks/s3/bucket"
  bucket_name = "plc-metrics-webapp-db-backup-${var.stage}"

  expire_enabled = true
}

module "logs_bucket" {
  source      = "../../stacks/s3/bucket"
  bucket_name = "plc-metrics-webapp-logs-${var.stage}"

  expire_enabled = true
}


module "forward_message_lambda" {
  source = "../../stacks/node-lambda"

  lambda_function_name = "plc-metrics-etl-check-backup-${var.stage}"
  lambda_timeout       = 900
  env                  = var.stage

  scheduling_enabled  = var.stage == "prod"
  schedule_expression = "rate(1 day)"

  cloudwatch_enabled = true

  allowed_bucket_resources = [module.backups_bucket.bucket_arn]

  tags = local.tags
}
