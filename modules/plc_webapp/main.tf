module "backups_bucket" {
  source      = "../../stacks/s3/bucket"
  bucket_name = "plc-metrics-webapp-db-backup-${var.stage}"
}
