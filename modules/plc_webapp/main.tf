module "backups_bucket" {
  source      = "../../stacks/s3/bucket"
  bucket_name = "plc-metrics-webapp-db-backup-${var.stage}"

  lifecycle_rule_enabled = true
  days_until_expire = 45
}

module "logs_bucket" {
  source      = "../../stacks/s3/bucket"
  bucket_name = "plc-metrics-webapp-logs-${var.stage}"

  lifecycle_rule_enabled = true
  days_until_expire = 45
}
