variable "stage" {
  description = "Deployment environment."
  type        = string
}

locals {
  app = "ci-cd-example"
}

locals {
  tags = {
    Service     = local.app
    Environment = var.stage
  }
}
