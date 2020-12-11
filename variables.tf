variable "batch_size" {
  type        = string
  description = "The largest number of records that Lambda will retrieve from your event source at the time of invocation. Defaults to 100 for DynamoDB and Kinesis, 10 for SQS."
  default     = ""
}

variable "event_source_arn" {
  type        = string
  description = "he event source ARN - can either be a Kinesis or DynamoDB stream"
}

variable "enabled" {
  type        = string
  description = "Determines if the mapping will be enabled on creation. Defaults to true."
  default     = "true"
}

variable "function_name" {
  type        = string
  description = "The name or the ARN of the Lambda function that will be subscribing to events."
}

variable "starting_position" {
  type        = string
  description = "The position in the stream where AWS Lambda should start reading. Must be one of AT_TIMESTAMP (Kinesis only), LATEST or TRIM_HORIZON if getting events from Kinesis or DynamoDB. Must not be provided if getting events from SQS."
  default     = ""
}

variable "starting_position_timestamp" {
  type        = string
  description = "A timestamp in RFC3339 format of the data record which to start reading when using starting_position set to AT_TIMESTAMP. If a record with this exact timestamp does not exist, the next later record is chosen. If the timestamp is older than the current trim horizon, the oldest available record is chosen."
  default     = ""
}

variable "has_dynamodb" {
  type        = string
  description = "true or false"
  default     = "false"
}

variable "has_kinesis" {
  type        = string
  description = "true or false"
  default     = "false"
}

variable "has_sqs" {
  type        = string
  description = "true or false"
  default     = "false"
}

