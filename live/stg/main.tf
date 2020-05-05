terraform {
  required_version = "= 0.12.24"

  backend "s3" {
    region = "eu-west-1"
    bucket = "stefan-georgescu-terraform-state"
    key    = "stg.terraform.tfstate"
  }
}
