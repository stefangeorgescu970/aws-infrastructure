terraform {
  required_version = "= 0.14.7"

  backend "s3" {
    region                  = "eu-central-1"
    bucket                  = "stefan-georgescu-terraform-states"
    key                     = "stg.terraform.tfstate"
    shared_credentials_file = "~/.aws/own-aws-files/credentials"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region                  = var.aws_region
  shared_credentials_file = "~/.aws/own-aws-files/credentials"

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

module "home_watcher_infrastructure" {
  source = "../../modules/home_watcher"

  stage = var.stage
}
