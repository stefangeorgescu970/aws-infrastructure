terraform {
  required_version = "= 0.12.24"

  backend "s3" {
    region = "eu-west-1"
    bucket = "stefan-georgescu-terraform-state"
    key    = "dev.terraform.tfstate"
  }
}

provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region
}

module "ci_cd_example_infrastructure" {
  source = "../../modules/ci_cd_example"

  stage = var.stage
}
