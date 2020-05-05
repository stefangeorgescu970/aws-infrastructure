variable "repositories_to_store" {
  description = "The repository names for which artefacts will be stored."
  type        = list(string)
}

variable "stage" {
  type        = string
  description = "Environment for deploy."
}

variable "aws_region" {
  type        = string
  description = "Region for AWS services."
}
