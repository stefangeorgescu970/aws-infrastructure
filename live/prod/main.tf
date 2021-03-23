terraform {
  required_version = "= 0.13.6"

  backend "s3" {
    region                  = "eu-central-1"
    bucket                  = "stefan-georgescu-terraform-states"
    key                     = "prod.terraform.tfstate"
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
    role_arn = "arn:aws:iam::371199941877:role/ProductionEnvironmentAdminRole"
  }
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
