provider "aws" {
  region = var.region
}

data "aws_api_gateway_rest_api" "user_auth_api" {
  rest_api_id = "gqm0zv3h7j"
}

resource "aws_api_gateway_resource" "auth" {
  rest_api_id = data.aws_api_gateway_rest_api.user_auth_api.id
  parent_id   = data.aws_api_gateway_rest_api.user_auth_api.root_resource_id
  path_part   = "auth"
}

resource "aws_api_gateway_method" "post_auth" {
  rest_api_id   = data.aws_api_gateway_rest_api.user_auth_api.id
  resource_id   = aws_api_gateway_resource.auth.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_lambda_function" "auth_lambda" {
  function_name    = "UserAuthFunction"
  handler          = "index.handler"
  runtime          = "nodejs14.x"
  role             = aws_iam_role.lambda_exec.arn
  source_code_hash = filebase64sha256("path/to/your/lambda.zip")
}

resource "aws_api_gateway_integration" "auth_integration" {
  rest_api_id             = data.aws_api_gateway_rest_api.user_auth_api.id
  resource_id             = aws_api_gateway_resource.auth.id
  http_method             = aws_api_gateway_method.post_auth.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.auth_lambda.invoke_arn
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_policy" {
  name       = "lambda_policy_attachment"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}