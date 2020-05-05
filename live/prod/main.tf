terraform {
  required_version = "= 0.12.24"

  backend "s3" {
    region = "eu-west-1"
    bucket = "stefan-georgescu-terraform-state"
    key    = "prod.terraform.tfstate"
  }
}

provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region

  assume_role {
    role_arn = "arn:aws:iam::371199941877:role/ProductionEnvironmentAdminRole"
  }
}
