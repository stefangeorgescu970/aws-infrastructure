module "backups_bucket" {
  source      = "../../stacks/s3/bucket"
  bucket_name = "plc-metrics-webapp-db-backup-${var.stage}"
}

module "logs_bucket" {
  source      = "../../stacks/s3/bucket"
  bucket_name = "plc-metrics-webapp-logs-${var.stage}"
}
