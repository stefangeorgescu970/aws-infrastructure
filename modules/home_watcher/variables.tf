variable "stage" {
  description = "Deployment environment."
  type        = string
}

locals {
  app = "home-watcher"
}

locals {
  tags = {
    Service     = local.app
    Environment = var.stage
  }
}
