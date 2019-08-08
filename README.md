
# terraform-aws-lambda-event-source-mapping

Terraform module that creates Lambda functions of event source mapping in AWS of type DynamoDB, SQS and Kinesis.

* Required Modules :
  * Module [Lambda-Function](https://registry.terraform.io/modules/corpit-consulting-public/lambda-function-mod/aws/0.1.3)
  * Module [DynamoDB](https://registry.terraform.io/modules/corpit-consulting-public/dynamodb-table-mod/aws/0.1.2)
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

## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| batch\_size | The largest number of records that Lambda will retrieve from your event source at the time of invocation. Defaults to 100 for DynamoDB and Kinesis, 10 for SQS. | string | `""` | no |
| enabled | Determines if the mapping will be enabled on creation. Defaults to true. | string | `"true"` | no |
| event\_source\_arn | he event source ARN - can either be a Kinesis or DynamoDB stream | string | n/a | yes |
| function\_name | The name or the ARN of the Lambda function that will be subscribing to events. | string | n/a | yes |
| has\_dynamodb | true or false | string | `"false"` | no |
| has\_kinesis | true or false | string | `"false"` | no |
| has\_sqs | true or false | string | `"false"` | no |
| starting\_position | The position in the stream where AWS Lambda should start reading. Must be one of AT_TIMESTAMP (Kinesis only), LATEST or TRIM_HORIZON if getting events from Kinesis or DynamoDB. Must not be provided if getting events from SQS. | string | `""` | no |
| starting\_position\_timestamp | A timestamp in RFC3339 format of the data record which to start reading when using starting_position set to AT_TIMESTAMP. If a record with this exact timestamp does not exist, the next later record is chosen. If the timestamp is older than the current trim horizon, the oldest available record is chosen. | string | `""` | no |

