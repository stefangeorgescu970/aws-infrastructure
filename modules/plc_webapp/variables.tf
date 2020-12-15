variable "stage" {
  description = "Deployment environment."
  type        = string
}

locals {
  app = "plc-webapp"
}

locals {
  tags = {
    Service     = local.app
    Environment = var.stage
  }
}
