data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name               = "lambda-role-${var.lambda_function_name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "acess_cloudwatch" {
  count      = var.cloudwatch_enabled ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_role.name
}

data "aws_iam_policy_document" "allow_access_s3_buckets" {
  statement {
    actions   = ["s3:*"]
    resources = var.allowed_bucket_resources
    effect    = "Allow"
  }
}

resource "aws_iam_role_policy" "access_s3_buckets" {
  count  = length(var.allowed_bucket_resources) == 0 ? 0 : 1
  name   = "${aws_iam_role.lambda_role.name}-lambda-s3-access"
  role   = aws_iam_role.lambda_role.id
  policy = data.aws_iam_policy_document.allow_access_s3_buckets.json
}

data "aws_iam_policy_document" "allow_access_ses_topics" {
  statement {
    actions   = ["ses:SendEmail", "ses:SendRawEmail"]
    resources = ["*"]
    effect    = "Allow"
  }
}

resource "aws_iam_role_policy" "access_ses_topics" {
  name   = "${aws_iam_role.lambda_role.name}-lambda-ses-access"
  role   = aws_iam_role.lambda_role.id
  policy = data.aws_iam_policy_document.allow_access_ses_topics.json
}
