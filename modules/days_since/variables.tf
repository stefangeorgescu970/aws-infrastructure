variable "stage" {
  description = "Deployment environment."
  type        = string
}

variable "vpc_id" {
  description = "Id of the VPC to deploy services."
  type        = string
}

variable "ssh_ip" {
  description = "The IP to allow ssh in AWS Security Groups."
  type        = string
}

variable "instance_key_pair_name" {
  description = "Key pair name in aws account."
  type        = string
}

locals {
  app = "days-since"
}

locals {
  tags = {
    Service     = local.app
    Environment = var.stage
  }
  instance_name = "${local.app}-server-${var.stage}"
}
