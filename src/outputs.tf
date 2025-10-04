output "api_gateway_endpoint" {
  value = aws_api_gateway_deployment.example.invoke_url
}

output "lambda_function_name" {
  value = aws_lambda_function.example.function_name
}