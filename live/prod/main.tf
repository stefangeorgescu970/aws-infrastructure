terraform {
  required_version = "~> 1.1.5"

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


module "days_since_infrastructure" {
  source = "../../modules/days_since"

  stage = var.stage
  instance_key_pair_name = "days-since-prod"
  vpc_id = "vpc-5d3dec37"
  ssh_ip = "82.137.48.184/32"
}
