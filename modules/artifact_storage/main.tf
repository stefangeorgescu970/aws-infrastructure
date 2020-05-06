module "artifacts_bucket" {
  source      = "../../stacks/s3/bucket"
  bucket_name = "stefan-georgescu-deployment-artifacts"
}

resource "aws_s3_bucket_object" "upload_default_property_file" {
  count = length(var.repositories_to_store)

  bucket  = module.artifacts_bucket.bucket_name
  key     = "${var.repositories_to_store[count.index]}/deploy.properties"
  content = file("${path.module}/resources/default_deploy.properties")
}
