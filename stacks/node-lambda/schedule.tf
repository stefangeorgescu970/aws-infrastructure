resource "aws_cloudwatch_event_rule" "trigger_lambda" {
  count = var.scheduling_enabled ? 1 : 0

  name                = "trigger-${var.lambda_function_name}"
  description         = "Schedule rule for triggering lambda"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  count = var.scheduling_enabled ? 1 : 0

  rule      = aws_cloudwatch_event_rule.trigger_lambda[0].name
  target_id = "lambda_target"
  arn       = aws_lambda_function.lambda.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_lambda" {
  count = var.scheduling_enabled ? 1 : 0

  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.trigger_lambda[0].arn
}
