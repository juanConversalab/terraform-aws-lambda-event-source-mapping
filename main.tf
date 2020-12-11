####For DynamoDB

resource "aws_lambda_event_source_mapping" "mapping_dynamodb" {
  count             = var.has_dynamodb ? 1 : 0
  batch_size        = var.batch_size
  event_source_arn  = var.event_source_arn
  function_name     = var.function_name
  starting_position = var.starting_position
  enabled           = var.enabled
}

####For Kinesis

resource "aws_lambda_event_source_mapping" "mapping_kinesis" {
  count             = var.has_kinesis ? 1 : 0
  batch_size        = var.batch_size
  event_source_arn  = var.event_source_arn
  function_name     = var.function_name
  starting_position = var.starting_position
  enabled           = var.enabled
}

####For SQS

resource "aws_lambda_event_source_mapping" "mapping_sqs" {
  batch_size       = var.batch_size
  count            = var.has_sqs ? 1 : 0
  event_source_arn = var.event_source_arn
  function_name    = var.function_name
  enabled          = var.enabled
}

