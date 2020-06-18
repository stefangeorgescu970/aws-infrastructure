resource "aws_dynamodb_table" "network_data" {
  name           = "network-data-${var.stage}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "EntryID"
  range_key      = "Timestamp"

  attribute {
    name = "EntryID"
    type = "S"
  }

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
  hash_key       = "EntryID"
  range_key      = "Timestamp"

  attribute {
    name = "EntryID"
    type = "S"
  }

  attribute {
    name = "Timestamp"
    type = "N"
  }

  tags = local.tags
}
