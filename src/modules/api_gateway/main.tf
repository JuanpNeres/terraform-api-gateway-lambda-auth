resource "aws_api_gateway_rest_api" "api" {
  name        = "UserAuthAPI"
  description = "API for user authentication"
}

resource "aws_api_gateway_resource" "auth" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "auth"
}

resource "aws_api_gateway_method" "post_auth" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.auth.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_lambda_function" "auth_lambda" {
  function_name = "UserAuthFunction"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = aws_iam_role.lambda_exec.arn
  source_code_hash = filebase64sha256("path/to/your/lambda.zip")
}

resource "aws_api_gateway_integration" "auth_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.auth.id
  http_method             = aws_api_gateway_method.post_auth.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.auth_lambda.invoke_arn
}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = "prod"
}