# terraform-aws-rest-api-gateway-lambda-endpoint


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_integration.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_method.invoke_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_resource.path](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_iam_role_policy.api_gateway_lambda_invoke_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_lambda_permission.api_gateway_invoke](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_iam_policy_document.api_gateway_lambda_invoke_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_gateway_iam_role_name"></a> [api\_gateway\_iam\_role\_name](#input\_api\_gateway\_iam\_role\_name) | Name of the IAM role for the API Gateway | `string` | n/a | yes |
| <a name="input_api_gateway_id"></a> [api\_gateway\_id](#input\_api\_gateway\_id) | ID of the API Gateway | `string` | n/a | yes |
| <a name="input_api_gateway_name"></a> [api\_gateway\_name](#input\_api\_gateway\_name) | Name of the API Gateway | `string` | n/a | yes |
| <a name="input_http_method"></a> [http\_method](#input\_http\_method) | HTTP method to use for the API Gateway | `string` | `"POST"` | no |
| <a name="input_lambda_arn"></a> [lambda\_arn](#input\_lambda\_arn) | ARN of the lambda function | `string` | n/a | yes |
| <a name="input_listen_path"></a> [listen\_path](#input\_listen\_path) | Path to listen on for the API Gateway, single level only | `string` | n/a | yes |
| <a name="input_path_resource_id"></a> [path\_resource\_id](#input\_path\_resource\_id) | ID of the API Gateway path or root resource | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resources generated by this module | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_path"></a> [path](#output\_path) | The path of the resource that has been created |
<!-- END_TF_DOCS -->