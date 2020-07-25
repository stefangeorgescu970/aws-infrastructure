resource "aws_dynamodb_table" "network_data" {
  name           = "network-data-${var.stage}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "Timestamp"

  attribute {
    name = "Timestamp"
    type = "N"
  }

  tags = local.tags
}

resource "aws_dynamodb_table" "logs" {
  name           = "network-service-logs-${var.stage}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "Timestamp"

  attribute {
    name = "Timestamp"
    type = "N"
  }

  tags = local.tags
}

resource "aws_dynamodb_table" "auth" {
  name           = "network-service-auth-${var.stage}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "Email"

  attribute {
    name = "Email"
    type = "S"
  }

  tags = local.tags
}
