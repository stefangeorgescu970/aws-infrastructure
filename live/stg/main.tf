terraform {
  required_version = "= 0.12.24"

  backend "s3" {
    region = "eu-central-1"
    bucket = "stefan-georgescu-terraform-states"
    key    = "stg.terraform.tfstate"
  }
}

provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region

  assume_role {
    role_arn = "arn:aws:iam::691933307799:role/StagingEnvironmentAdminRole"
  }
}

module "artifact_store" {
  source = "../../modules/artifact_storage"

  repositories_to_store = ["ci-cd-example", "home-watcher-api"]
  aws_region            = var.aws_region
  stage                 = var.stage
}

module "ci_cd_example_infrastructure" {
  source = "../../modules/ci_cd_example"

  stage = var.stage
}
