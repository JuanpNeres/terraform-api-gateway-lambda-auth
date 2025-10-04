output "api_gateway_endpoint" {
  value = aws_api_gateway_deployment.user_auth_deployment.invoke_url
}

output "lambda_function_name" {
  value = aws_lambda_function.auth_lambda.function_name
}