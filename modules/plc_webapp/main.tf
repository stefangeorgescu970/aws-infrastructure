module "backups_bucket" {
  source      = "../../stacks/s3/bucket"
  bucket_name = "plc-metrics-webapp-db-backup-${var.stage}"
}

module "logs_bucket" {
  source      = "../../stacks/s3/bucket"
  bucket_name = "plc-metrics-webapp-logs-${var.stage}"
}


module "forward_message_lambda" {
  source = "../../stacks/node-lambda"

  lambda_function_name = "plc-metrics-etl-check-backup-${var.stage}"
  lambda_timeout       = 900
  env                  = var.stage

  scheduling_enabled  = true
  schedule_expression = "rate(1 day)"

  cloudwatch_enabled = true

  allowed_ses_topic_arns = []
  allowed_bucket_resources = []

  tags = local.tags
}
