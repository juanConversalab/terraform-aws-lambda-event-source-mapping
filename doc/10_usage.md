## Usage

```hcl

module "lambda_mapping_dynamodb_dev" {
  source            = "./modules/terraform-aws-lambda-event-source-mapping"
  batch_size        = "${var.batch_size}"
  event_source_arn  = "${module.dynamo-table-dev.stream_arn}"
  function_name     = "${module.lambda-function.arn}"
  starting_position = "${var.starting_position}"
  enabled           = "${var.enabled}"
  has_dynamodb      = "true"
}

module "lambda_mapping_dynamodb_prod" {
  source            = "./modules/terraform-aws-lambda-event-source-mapping"
  batch_size        = "${var.batch_size}"
  event_source_arn  = "${module.dynamo-table-prod.stream_arn}"
  function_name     = "${module.lambda-function.arn}"
  starting_position = "${var.starting_position}"
  enabled           = "${var.enabled}"
  has_dynamodb      = "true"
}

```
