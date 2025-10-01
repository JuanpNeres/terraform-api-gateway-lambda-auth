resource "aws_api_gateway_rest_api" "user_auth_api" {
  name        = "UserAuthAPI"
  description = "API for user authentication"
}

resource "aws_api_gateway_resource" "auth" {
  rest_api_id = aws_api_gateway_rest_api.user_auth_api.id
  parent_id   = aws_api_gateway_rest_api.user_auth_api.root_resource_id
  path_part   = "auth"
}

resource "aws_api_gateway_method" "post_auth" {
  rest_api_id   = aws_api_gateway_rest_api.user_auth_api.id
  resource_id   = aws_api_gateway_resource.auth.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.user_auth_api.id
  resource_id             = aws_api_gateway_resource.auth.id
  http_method             = aws_api_gateway_method.post_auth.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.user_auth_lambda.invoke_arn
}

resource "aws_api_gateway_deployment" "user_auth_deployment" {
  rest_api_id = aws_api_gateway_rest_api.user_auth_api.id
  stage_name  = "prod"

  depends_on = [
    aws_api_gateway_integration.lambda_integration
  ]
}