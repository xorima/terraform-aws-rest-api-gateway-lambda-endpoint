resource "aws_api_gateway_resource" "path" {
  rest_api_id = var.api_gateway_id
  parent_id   = var.path_resource_id
  path_part   = var.listen_path
}

resource "aws_api_gateway_method" "invoke_lambda" {
  rest_api_id   = var.api_gateway_id
  resource_id   = aws_api_gateway_resource.path.id
  http_method   = var.http_method
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = var.api_gateway_id
  resource_id = aws_api_gateway_resource.path.id
  http_method = aws_api_gateway_method.invoke_lambda.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${local.lambda_region}:lambda:path/2015-03-31/functions/${var.lambda_arn}/invocations"
}


data "aws_iam_policy_document" "api_gateway_lambda_invoke_policy" {
  statement {
    actions   = ["lambda:InvokeFunction"]
    resources = [var.lambda_arn]
  }
}

resource "aws_iam_role_policy" "api_gateway_lambda_invoke_policy_attachment" {
  name   = "APIGateway-${var.api_gateway_name}-LambdaInvoke-${local.lambda_name}"
  role   = var.api_gateway_iam_role_name
  policy = data.aws_iam_policy_document.api_gateway_lambda_invoke_policy.json
}

locals {
}

resource "aws_lambda_permission" "api_gateway_invoke" {
  statement_id  = "APIGateway-${local.normalised_gateway_name}-AllowInvoke-${local.lambda_name}"
  action        = "lambda:InvokeFunction"
  function_name = local.lambda_name
  principal     = "apigateway.amazonaws.com"
}
