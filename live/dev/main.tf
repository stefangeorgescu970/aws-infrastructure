terraform {
  required_version = "= 0.14.7"

  backend "s3" {
    region = "eu-central-1"
    bucket = "stefan-georgescu-terraform-states"
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

module "home_watcher_infrastructure" {
  source = "../../modules/home_watcher"

  stage = var.stage
}

module "plc_webapp_infrastructure" {
  source = "../../modules/plc_webapp"

  stage = var.stage
}
